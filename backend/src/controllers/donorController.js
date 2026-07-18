const supabase = require('../config/supabase');

// --- GET: LIHAT JADWAL DONOR MOBILE ---
const getMobileSchedules = async (req, res) => {
    const { branch_id } = req.query; // Opsional: jika ingin filter per UTD tertentu

    try {
        // Query dasar
        let query = supabase.from('mobile_schedules').select('*');
        
        // Jika user memfilter berdasarkan UTD
        if (branch_id) {
            query = query.eq('pmi_branch_id', branch_id);
        }

        const { data, error } = await query;
        if (error) throw error;

        res.status(200).json({ success: true, data });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

// --- POST: SUBMIT SELF-ASSESSMENT (Screening Mandiri) ---
const submitAssessment = async (req, res) => {
    // Data ini akan dikirim dari aplikasi mobile
    const { user_id, pmi_branch_id, destination_type, mobile_schedule_id, answers } = req.body;

    try {
        const { data, error } = await supabase
            .from('self_assessments')
            .insert([{
                user_id,
                pmi_branch_id,
                destination_type, // Isinya 'UTD' atau 'MOBILE'
                mobile_schedule_id: destination_type === 'MOBILE' ? mobile_schedule_id : null,
                answers // Format JSON (tensi, jam tidur, berat badan, dsb)
            }])
            .select();

        if (error) throw error;

        res.status(201).json({
            success: true,
            message: 'Self-assessment berhasil dikirim dan menunggu konfirmasi UTD!',
            data: data[0]
        });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

// --- POST: PERMINTAAN DARAH (Minta Darah) ---
const submitBloodRequest = async (req, res) => {
    const { user_id, pmi_branch_id, patient_name, blood_type, rhesus, quantity_bags, hospital_name, purpose } = req.body;

    try {
        const { data, error } = await supabase
            .from('blood_requests')
            .insert([{
                user_id,
                pmi_branch_id,
                patient_name,
                blood_type,
                rhesus,
                quantity_bags,
                hospital_name,
                purpose
            }])
            .select();

        if (error) throw error;

        res.status(201).json({
            success: true,
            message: 'Permintaan darah berhasil diajukan! Menunggu review admin.',
            data: data[0]
        });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

module.exports = { getMobileSchedules, submitAssessment, submitBloodRequest };