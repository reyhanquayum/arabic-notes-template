// showcase.typ

// 1. Import the template and all its helper functions.
//    The path "@local/arabic-notes:1.0.0" refers to the package
//    defined in typst.toml.
#import "template.typ": *

// 2. Apply the main template function to the document.
//    Provide the title, subtitle, and author here. The rest of the
//    file will be passed as the `body`.
#show: doc => arabic_notes(
  title: "This is the Title Text",
  subtitle: "هذا لفظ العنوان",
  author: "Student of Knowledge", // <-- Change this to your name
  doc,
)
// =================== SHOWCASE ===================

= Headings

This template provides styles for three levels of headings.

== This is a Level 2 Heading

And this is text under a level 2 heading.

=== This is a Level 3 Heading

And this is text under a level 3 heading.

= Inline Arabic

The template allows for inline Arabic, like this word #arr("عربي"), within an English sentence.

= Custom Blocks

Here are examples of all the custom blocks available in the template.

== Matn Block

This is a standard matn block:
#matn_block("هذا هو المتن الأساسي")

This is a matn block with a custom label:
#matn_block("الكَلَامُ: هُوَ الَّفْظُ المُرَكَّبُ المُفِيدُ بِالوَضْعِ", label: "متمّمة الآجرّومية")

== Example Block

This is an example block with only Arabic:
#arr_example("زيدٌ قائمٌ")

This is an example block with a translation:
#arr_example("جاء زيدٌ", translation: "Zayd came.")

== Qur'an Block

This is a Qur'an block with only Arabic:
#quran_block("قُلْ هُوَ ٱللَّهُ أَحَدٌ")

This is a Qur'an block with a translation and verse number:
#quran_block(
  "ٱهْدِنَا ٱلصِّرَٰطَ ٱلْمُسْتَقِيمَ",
  translation: "Guide us to the straight path.",
  verse: "Al-Fatihah: 6"
)

== Simple Arabic Block

This is a simple, centered Arabic block for general use:
#arr_block("هذا نص عربي في كتلة بسيطة")
