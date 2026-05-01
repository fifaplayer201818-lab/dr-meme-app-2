import '../models/content_models.dart';

class DemoContent {
  static final courses = [
    Course(
      id: 'american_science_g9',
      title: 'American Science - Grade 9',
      description: 'Netflix-style course with levels, videos, lesson quizzes, summaries, and final level exams.',
      imageUrl: '',
      levels: [
        Level(
          id: 'bio_l1',
          title: 'Level 1: Biology - Cells & Life',
          lessons: [
            Lesson(
              id: 'bio_l1_ep1',
              title: 'Episode 1: Introduction to Cells',
              videoUrl: 'PUT_YOUTUBE_OR_VIDEO_LINK_HERE',
              summaryPdfAsset: 'assets/pdfs/sample.pdf',
              quiz: [
                Question(text: 'What is the basic unit of life?', options: ['Atom', 'Cell', 'Organ', 'Tissue'], correctIndex: 1),
                Question(text: 'Which structure controls most cell activities?', options: ['Nucleus', 'Cell wall', 'Vacuole', 'Ribosome'], correctIndex: 0),
              ],
            ),
            Lesson(
              id: 'bio_l1_ep2',
              title: 'Episode 2: Plant and Animal Cells',
              videoUrl: 'PUT_YOUTUBE_OR_VIDEO_LINK_HERE',
              summaryPdfAsset: 'assets/pdfs/sample.pdf',
              quiz: [
                Question(text: 'Which cell has a cell wall?', options: ['Animal cell', 'Plant cell', 'Red blood cell', 'Muscle cell'], correctIndex: 1),
                Question(text: 'Which organelle is responsible for photosynthesis?', options: ['Mitochondria', 'Chloroplast', 'Nucleus', 'Ribosome'], correctIndex: 1),
              ],
            ),
          ],
          finalExam: [
            Question(text: 'Final Exam: Which organelle contains DNA?', options: ['Nucleus', 'Cytoplasm', 'Cell membrane', 'Vacuole'], correctIndex: 0),
            Question(text: 'Final Exam: Plant cells are different because they have:', options: ['Cell wall', 'Only cytoplasm', 'No nucleus', 'No membrane'], correctIndex: 0),
          ],
        ),
        Level(
          id: 'chem_l1',
          title: 'Level 2: Chemistry - Matter & Atoms',
          lessons: [
            Lesson(
              id: 'chem_l1_ep1',
              title: 'Episode 1: Atoms and Elements',
              videoUrl: 'PUT_YOUTUBE_OR_VIDEO_LINK_HERE',
              summaryPdfAsset: 'assets/pdfs/sample.pdf',
              quiz: [
                Question(text: 'What is the center of an atom called?', options: ['Electron', 'Nucleus', 'Shell', 'Molecule'], correctIndex: 1),
                Question(text: 'Which particle has a negative charge?', options: ['Proton', 'Neutron', 'Electron', 'Nucleus'], correctIndex: 2),
              ],
            ),
            Lesson(
              id: 'chem_l1_ep2',
              title: 'Episode 2: States of Matter',
              videoUrl: 'PUT_YOUTUBE_OR_VIDEO_LINK_HERE',
              summaryPdfAsset: 'assets/pdfs/sample.pdf',
              quiz: [
                Question(text: 'Which state of matter has a fixed shape?', options: ['Gas', 'Liquid', 'Solid', 'Plasma'], correctIndex: 2),
                Question(text: 'Evaporation changes liquid into:', options: ['Solid', 'Gas', 'Metal', 'Crystal'], correctIndex: 1),
              ],
            ),
          ],
          finalExam: [
            Question(text: 'Final Exam: Matter is anything that has:', options: ['Mass and volume', 'Only color', 'Only energy', 'No particles'], correctIndex: 0),
            Question(text: 'Final Exam: Protons are found in the:', options: ['Nucleus', 'Outer shell', 'Air', 'Bond only'], correctIndex: 0),
          ],
        ),
        Level(
          id: 'physics_l1',
          title: 'Level 3: Physics - Motion & Forces',
          lessons: [
            Lesson(
              id: 'phys_l1_ep1',
              title: 'Episode 1: Speed and Velocity',
              videoUrl: 'PUT_YOUTUBE_OR_VIDEO_LINK_HERE',
              summaryPdfAsset: 'assets/pdfs/sample.pdf',
              quiz: [
                Question(text: 'Speed equals distance divided by:', options: ['Mass', 'Time', 'Force', 'Energy'], correctIndex: 1),
                Question(text: 'Velocity includes speed and:', options: ['Color', 'Direction', 'Temperature', 'Shape'], correctIndex: 1),
              ],
            ),
            Lesson(
              id: 'phys_l1_ep2',
              title: 'Episode 2: Forces',
              videoUrl: 'PUT_YOUTUBE_OR_VIDEO_LINK_HERE',
              summaryPdfAsset: 'assets/pdfs/sample.pdf',
              quiz: [
                Question(text: 'A push or pull is called a:', options: ['Force', 'Cell', 'Atom', 'Wave'], correctIndex: 0),
                Question(text: 'The unit of force is:', options: ['Newton', 'Meter', 'Second', 'Liter'], correctIndex: 0),
              ],
            ),
          ],
          finalExam: [
            Question(text: 'Final Exam: If distance increases and time is the same, speed:', options: ['Increases', 'Decreases', 'Becomes zero', 'Does not exist'], correctIndex: 0),
            Question(text: 'Final Exam: Gravity is a type of:', options: ['Force', 'Cell', 'Chemical', 'Light only'], correctIndex: 0),
          ],
        ),
      ],
    ),
  ];
}
