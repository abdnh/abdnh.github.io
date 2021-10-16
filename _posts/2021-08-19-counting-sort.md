---
layout: post
title: "خوارزمية الترتيب بالعد"
tags: computer algorithm
uuid: a60601fa-4103-4573-8d99-d7f57c05009a
---

خوارزمية الترتيب بالعد هي [خوازمية ترتيب](https://ar.wikipedia.org/wiki/%D8%AE%D9%88%D8%A7%D8%B1%D8%B2%D9%85%D9%8A%D8%A9_%D8%AA%D8%B1%D8%AA%D9%8A%D8%A8)
للأعداد الصحيحة.

ترتّب الخوارزمية مصفوفة أعداد عن طريق إحصاء مرات تكرار كل عدد وتخزن هذه المعلومات
في مصفوفة جديدة (لنقل لها مصفوفة الإحصاء). ثم تحسب موضع كل عنصر
من مصفوفة المدخلات في مصفوفة المخرجات المرتبة باستخدام مصفوفة الإحصاء.

مع أن الخوارزمية متخصصة بالأعداد الصحيحة، يمكن تكييفها لترتيب مصفوفة من أي نوع من البيانات
ما دام لكل عنصر عدد صحيح متعلق به يمكن استخدامه كـ"مفتاح" وترتيبه.

## مثال

لنأخذ مثالا لتوضيح كيفية عمل الخوارزمية بتفصيل أكثر:
لنقل أننا نريد ترتيب سلسلة الحروف "the quick brown fox jumps over the lazy dog"
تصاعديا حسب قيم [ASCII](https://ar.wikipedia.org/wiki/%D8%A3%D8%B3%D9%83%D9%8A) العددية لحروفها.

سترتب الخوارزمية هذه السلسلة بهذه الخطوات:

1) نبدأ بحساب نطاق المفاتيح (الفرق بين أكبر وأصغر عنصر، لنسمه `range`) في مصفوفة الحروف لكي نستطيع
  حجز مساحة كافية لمصفوفة الإحصاء (لنسمها `count`). كما نبحث عن أصغر مفتاح أيضا لكي نستخدمه في فهرسة
  مصفوفة الإحصاء مع السماح بمفاتيح لا تبدأ بالصفر (نستخدم `count[key - offset]`
  للوصول إلى عدد مرات تكرار العنصر صاحب المفتاح `key` حيث `offset` هو أصغر مفتاح).
  سنحصل على القيم التالية بعد معالجة سلسلة الحروف: `offset = 32` و `range = 91`.
  تأكد من أن هذه القيم صحيحة بنفسك باستخدام [جدول ASCII الموجود في هذه الصفحة](https://ar.wikipedia.org/wiki/%D8%A3%D8%B3%D9%83%D9%8A#%D9%82%D8%A7%D8%A6%D9%85%D8%A9_%D8%A7%D9%84%D8%B1%D9%85%D9%88%D8%B2)
  (لا تنسَ أخذ حرف المسافة بعين الاعتبار).

2) نملأ الآن مصفوفة الإحصاء بمرات تكرار كل مفتاح لنحصل على مصفوفة بهذا الشكل:
{% highlight plaintext %}
i:        0 1 2 ...  65  66  67  68  69  70  71  72  73  74  75  76  77  78  79  80  81  82  83  84  85  86  87  88  89  90
count[i]: 8 0 0 ...   1   1   1   1   3   1   1   2   1   1   1   1   1   1   4   1   1   2   1   2   2   1   1   1   1   1
{% endhighlight %}

3) لكل فهرس `i` في مصفوفة الإحصاء، نجري العملية `count[i] += count[i - 1]`.
  بعد هذا، سيحمل `count[i]` الفهرس الأكبر بواحد من فهرس آخر عنصر بمفتاح `i + offset`
  في المصفوفة المرتبة النهائية. ستصبح مصفوفة الإحصاء بهذا الشكل الآن:
{% highlight plaintext %}
i:        0 1 2 ...  65  66  67  68  69  70  71  72  73  74  75  76  77  78  79  80  81  82  83  84  85  86  87  88  89  90
count[i]: 8 8 8 ...   9  10  11  12  15  16  17  19  20  21  22  23  24  25  29  30  31  33  34  36  38  39  40  41  42  43
{% endhighlight %}

4) نفحص سلسلة الحروف مجددا، لكن هذه المرة من آخرها إلى أولها (لضمان [الثبات](https://ar.wikipedia.org/wiki/%D8%AE%D9%88%D8%A7%D8%B1%D8%B2%D9%85%D9%8A%D8%A9_%D8%AA%D8%B1%D8%AA%D9%8A%D8%A8#%D9%85%D9%85%D9%8A%D8%B2_%D8%A7%D9%84%D8%AB%D8%A8%D8%A7%D8%AA)).
  نستخرج مفتاح كل عنصر، وننقص عداد العنصر الموجود في مصفوفة الإحصاء بواحد،
  ثم نخزن العنصر في موقعه الجديد في المصفوفة المرتبة باستخدام عداده في مصفوفة الإحصاء.
  بـ[السودوكود](https://ar.wikipedia.org/wiki/%D8%B3%D9%88%D8%AF%D9%88%D9%83%D9%88%D8%AF) كما هو معطى في [ويكيبديا الإنجليزية](https://en.wikipedia.org/wiki/Counting_sort#Pseudocode):
{% highlight plaintext %}
for i = length(input) - 1 downto 0 do
    j = key(input[i])
    count[j] -= 1
    output[count[j]] = input[i]
{% endhighlight %}

5) لقد انتهينا! لدينا الآن سلسلة حروف مرتبة:
{% highlight plaintext %}
'        abcdeeefghhijklmnoooopqrrsttuuvwxyz'
{% endhighlight %}

من ميزات هذه الخوارزمية أنها لا تعتمد على مبدأ المقارنة بين العناصر المراد ترتيبها المستخدم
بشيوع في خوارزميات ترتيب عديدة مثل Quicksort و Merge sort وغيرها.
هذا لأنها مخصصة لترتيب الأعداد الصحيحة والتي يمكن معاملتها كفهارس (indices)
وإيجاد ترتيبها الصحيح بدون الحاجة للمقارنات. تمنح هذه الميزة للخوارزمية
[تعقيدا زمنيا خطيا](https://ar.wikipedia.org/wiki/%D8%AA%D8%B9%D9%82%D9%8A%D8%AF_%D8%A7%D9%84%D9%88%D9%82%D8%AA#%D8%A7%D9%84%D9%88%D9%82%D8%AA_%D8%A7%D9%84%D8%AE%D8%B7%D9%8A)
لا تستطيع الخوارزميات الأخرى المعتمدة على المقارنة تجاوزه لأن حدها السفلي O(n log n) رياضيا.[^1]

تحتاج الخوارزمية لمساحة O(n + k) حيث n عدد العناصر في مصفوفة المدخلات و k نطاق العناصر.
تأتي n من حقيقة أن الخوارزمية لا تغير البيانات الموجودة في مصفوفة المدخلات بل تنشئ مصفوفة جديدة وتنسخ المدخلات المرتبة إليها.
هذا ضروري لضمان [الثبات](https://ar.wikipedia.org/wiki/%D8%AE%D9%88%D8%A7%D8%B1%D8%B2%D9%85%D9%8A%D8%A9_%D8%AA%D8%B1%D8%AA%D9%8A%D8%A8#%D9%85%D9%85%D9%8A%D8%B2_%D8%A7%D9%84%D8%AB%D8%A8%D8%A7%D8%AA)،
(الترتيب النسبي للعناصر المتساوية). يمكن تبسيط الخوارزمية وجعلها لا تحتاج إلّا إلى O(k) مساحة،
لكن هذا يجعلها غير ثابتة ولا يجعلها مفيدة لأكبر مجال استخدام لها وهو كدالة فرعية في خوارزمية ترتيب
أخرى تدعى [Radix sort](https://en.wikipedia.org/wiki/Radix_sort).
تأتي مساحة k من مصفوفة الإحصاء التي نخزن فيها مرات تكرار كل عدد من مصفوفة المدخلات.
يجب أن تكون هذه المصفوفة كبيرة كفاية لتشمل كل نطاق الأعداد المدخلة فمبدأ عمل الخوارزمية
يعتمد على ذلك. يُفضَّل استخدام خوارزمية الترتيب بالعد عندما لا تكون قيمة k أكبر من قيمة n بكثير، وإلا قد
يكون استخدام خوارزميات أخرى أكثر فعالية عندما تكون k أكبر بكثير من n.

## استعراض تفاعلي للخوارزمية

استخدم هذا البرنامج التفاعلي المضمن لفهم الخوارزمية أكثر . جرب إدخال بعض الأرقام أو الكلمات والضغط على «تشغيل»
لكي يرتبها البرنامج، ثم اضغط «إيقاف» واستخدم خياري «التقدم بخطوة» و«الرجوع بخطوة» لفحص عمل الخوارزمية خطوة بخطوة.

{::nomarkdown}
<iframe src="https://www.abdnh.net/counting-sort-demo/?lang=ar" allow="fullscreen"></iframe>
{:/}

اضغط على هذا الرابط إذا كانت نافذة البرنامج لا تظهر كليا أو هناك مشكلة في عرضها: <https://www.abdnh.net/counting-sort-demo/?lang=ar>

## تطبيق للخوارزمية

في الأسفل تطبيق للخوارزمية في لغة C:

{% highlight c linenos %}
{% raw %}
#include <limits.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct item {
    void *data;
    unsigned key;
};

bool counting_sort(struct item array[], unsigned length) {
    // احسب النطاق وأصغر مفتاح
    unsigned offset = UINT_MAX;
    unsigned end = 0;
    for (unsigned i = 0; i < length; i++) {
        unsigned key = array[i].key;
        if (key < offset)
            offset = key;
        if (key > end)
            end = key;
    }
    unsigned range = end - offset + 1;

    // احجز مساحة للمصفوفة المرتبة ومصفوفة الإحصاء
    struct item *sorted = malloc(sizeof(struct item) * length);
    if (!sorted)
        return false;
    unsigned *count = calloc(range, sizeof(unsigned));
    if (!count) {
        free(sorted);
        return false;
    }

    // احسب مرات تكرار كل مفتاح
    for (unsigned i = 0; i < length; i++) {
        count[array[i].key - offset]++;
    }

    // احسب موضع عناصر كل مفتاح في المصفوفة المرتبة
    for (unsigned i = 0; i < range - 1; i++) {
        count[i + 1] += count[i];
    }

    // ضع كل عنصر في موضعه في المصفوفة المرتبة
    for (unsigned i = length - 1; i != UINT_MAX; i--) {
        unsigned j = array[i].key - offset;
        count[j]--;
        sorted[count[j]] = array[i];
    }

    // انسخ النتيجة النهائية إلى المصفوفة المدخلة وحرر المساحة التي حجزناها مسبقا
    memcpy(array, sorted, sizeof(*array) * length);
    free(sorted);
    free(count);

    return true;
}

int main(void) {
    struct item array[] = {{.data = "foo"},
                           {.data = "bar"},
                           {.data = "ah"},
                           {.data = "spam"},
                           {.data = "oh"}};
    unsigned length = sizeof(array) / sizeof(array[0]);

    for (unsigned i = 0; i < length; i++) {
        array[i].key = ((char *)array[i].data)[0];
    }

    if (!counting_sort(array, length)) {
        fputs("out of memory\n", stderr);
    }

    for (unsigned i = 0; i < length; i++) {
        printf("key = %u , data = '%s'\n", array[i].key, (char *)array[i].data);
    }

    return 0;
}
{% endraw %}
{% endhighlight %}

لتطبيق أعم وأكثر مرونة، اطلع على هذه المكتبة البسيطة التي كتبتها: <https://github.com/abdnh/counting-sort>

## مصادر

- استعراض مرئي آخر للترتيب بالعد: <https://www.cs.usfca.edu/~galles/visualization/CountingSort.html>
- شرح آخر للخوارزمية على موسوعة حسوب: <https://wiki.hsoub.com/Algorithms/counting_sort>

[^1]: انظر [Comparison sort](https://en.wikipedia.org/wiki/Comparison_sort#Performance_limits_and_advantages_of_different_sorting_techniques) في ويكيبيديا الإنجليزية.
