// Step 1: Import the template function from the other file
#import "template.typ": lesson-notes

// Step 2: Call the function with your document's details
// everything inside the brackets `{...}` is your main content
#lecture-notes(
  title: "Mutammimah al Ajurrumiyyah Lesson Notes #35",
  author: "Your Name Here",
  subtitle: [ #text(dir: rtl, "إنّ وأخواتها") ],
) {
  // notes go here.
  // use headings, lists, and the custom functions defined in the template

  = Introduction

  After discussing #text(dir: rtl, "كان وأخواتها"), the author introduces the next category of #text(dir: rtl, "نواسخ"): #text(dir: rtl, "إن وأخواتها").

  The author states:
  #matn_block("وأما إن وأخواتها فتنصب المبتدأ ويسمى اسمها وترفع الخبر ويسمى خبرها")

  - As for #text(dir: rtl, "إن وأخواتها"), they give #text(dir: rtl, "نصب") to the #text(dir: rtl, "مبتدأ"), and it is called its #text(dir: rtl, "اسم"). They give #text(dir: rtl, "رفع") to the #text(dir: rtl, "خبر"), and it is called its #text(dir: rtl, "خبر").

  #matn_block("وهي ستة أحرف")

  - And they are six #text(dir: rtl, "حروف").

  = The Meanings of the Sisters of #text(dir: rtl, "إن")

  == #text(dir: rtl, "إنّ") and #text(dir: rtl, "أنّ")

  #matn_block("وهما لتوكيد النسبة ونفي الشك عنها")

  - These two are for emphasizing the attribution and negating doubt about it.

  #strong[Examples:]
  #arr_example("1. فإن الله غفور رحيم")
  #arr_example("2. ذلك بأن الله هو الحق")

  == #text(dir: rtl, "لكنّ")

  #matn_block("ولكن للاستدراك")

  #strong[Example from the Quran:]
  #quran_block(
    "لَـٰكِنِ ٱلَّذِينَ ٱتَّقَوْا۟ رَبَّهُمْ لَهُمْ جَنَّـٰتٌ...",
    translation: "But those who are mindful of their Lord will be in Gardens...",
    verse: "Ali 'Imran: 198"
  )
}
