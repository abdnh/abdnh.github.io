---
layout: post
title: "كيف تصبح هاكرا حقيقيا: شاهد أنمياتك المفضلة من سطر الأوامر"
tags: computer Anime
uuid: 76663eb0-0c1f-40d6-b13a-cec1b59f04c7
---

حسنا، لقد رميت ويندوز في سلة المهملات وانتقلت إلى لينكس بعد عدة محاولات باءت بالفشل
لأن تعريف الواي فاي اللعين يأبى إلا أن لا يعمل. لكنه يعمل الآن، وأخيرا!
وكأي مستخدم لينكس ونيرد أصيل، فقد تعلمت استخدام سطر الأوامر وبدأت تستخدمه لكل
أعمالك الحاسوبية... ما عدا مشاهدة أنمياتك المفضلة (احتمال أنك مستخدم لينكس ومتابع أنمي في الوقت نفسه يقارب 99%).
لكنك تشعر بالذنب والخوف من أن تُتهم بأنك شخص عادي (أو normie) بسبب ذلك.

لا تقلق! سأشرح لك في هذه المقالة كيف يمكنك مشاهدة شخصيات الموي المفضلة لديك
بدون مغادرة الطرفية!

## المتطلبات

نحتاج البرامج التالية لتنفيذ هدفنا النبيل:
- مكتبة [libsixel](https://github.com/saitoha/libsixel) لدعم صيغة رسوميات [Sixel](https://en.wikipedia.org/wiki/Sixel)
(وهي ما سيمكننا من عرض الفيديو في الطرفية).
- مشغل وسائط [mpv](https://mpv.io/).
- محاكي الطرفية [mlterm](http://mlterm.sourceforge.net/).

سأشرح كيفية التنصيب للتوزيعات المبنية على ديبيان، لكن يمكنك طبعا تطبيق تعليمات مشابهة في أي توزيعة.

## التنصيب على توزيعات ديبيان

- نصب libsixel باستخدام الأمر التالي:
{% highlight plaintext %}
sudo apt install libsixel-dev
{% endhighlight %}
- نصب mlterm باستخدام
{% highlight plaintext %}
sudo apt install mlterm
{% endhighlight %}

جئنا للجزء الصعب: مشغل mpv لا يأتي عادة مع دعم لصيغة Sixel، لذلك لن تعمل النسخة المنصبة بمدير الحزم APT غالبا.
الحل هو أن نبني نسختنا الخاصة من البرنامج من الشفرة المصدرية مع تفعيل دعم Sixel.
لبناء البرنامج اتبع الخطوات التالية:
- نزل كود mpv باستخدام git في مجلد ما:
{% highlight plaintext %}
git clone https://github.com/mpv-player/mpv
{% endhighlight %}
- يدعم mpv كل من أداتي بناء meson و waf. سنستخدم هنا meson، لذلك نصبه باستخدام الأمر التالي[^1]:
{% highlight plaintext %}
pip3 install --user meson
{% endhighlight %}
يبدو أن إصدار meson الموجود في APT لا يعمل مع mpv في وقت كتابة هذه الأسطر لأنه قديم بعض الشيء.
- ابنِ mpv ونصبه باستخدام الأوامر التالية[^2]:
{% highlight plaintext %}
meson build -D sixel=enabled
meson compile -C build
meson install -C build
{% endhighlight %}
إذا صادفت أي أخطاء حول مكاتب متطلبة ناقصة، جرب هذا الأمر لتنزيلها:
{% highlight plaintext %}
 sudo apt build-dep mpv
{% endhighlight %}
أو ابحث في الإنترنت حول كيفية تنصيب المكتبة الناقصة.

انتهينا من تفاصيل التنصيب المملة وحان وقت المتعة!

- افتح طرفية mlterm بتشغيل الأمر `mlterm` من طرفيتك المفضلة.
- اذهب إلى مجلد فيه فيديوهات الأنمي المفضل لديك باستخدام `cd`.
- نفذ الأمر التالي مع تغيير اسم الفيديو `anime.mp4`:
{% highlight plaintext %}
mpv --vo=sixel --profile=sw-fast --really-quiet anime.mp4
{% endhighlight %}
- يمكنك أيضا تغيير حجم نافذة الفيديو باستخدم خيارات `--vo-sixel-width=<width>, --vo-sixel-height=<height>`‏[^3]:
{% highlight plaintext %}
mpv --vo=sixel --profile=sw-fast --really-quiet anime.mp4 --vo-sixel-width=800 --vo-sixel-height=600
{% endhighlight %}
- استمتع بمشاهدة الأنمي!

{% include image.html file="mlterm-linux.png"
   caption="مشاهدة الأنمي من سطر الأوامر في لينكس"
%}

## التنصيب على ويندوز

قبل أن تتهمني بالخيانة العظمى وتغلق الصفحة، تريث قليلا. إنما أشرح الطريقة على ويندوز
فقط لكي أقنع المساكين مستخدمي ويندوز بروعة سطر الأوامر وأجعلهم يتنقلون إلى لينكس.[^4]

خطوات التنصيب على ويندوز كالتالي:
- بجانب [المتطلبات الأساسية](#المتطلبات) تحتاج أيضا إلى تثبيت حزمة [MSYS2](https://www.msys2.org/).
اذهب إلى <https://www.msys2.org/#installation> ونزل البرنامج.
- نزل mlterm من خلال الموقع الرسمي (نسخة msys2): <http://mlterm.sourceforge.net/bin.html>
- انسخ مجلدات "bin", "etc", "lib" و "libexec" في الملف المضغوط الذي نزلته (mlterm-msys2-YYYYMMDD.zip)
  إلى مجلد `c:\msys64\usr` (أو المجلد الذي نصبت فيه MSYS2)، حيث تكون ملفات كل مجلد داخل المجلد ذي الاسم نفسه في
  `c:\msys64\usr`.
- اتبع تعليمات بناء mpv من المصدر الموجودة في وثائق البرنامج هنا: <https://github.com/mpv-player/mpv/blob/master/DOCS/compile-windows.md#native-compilation-with-msys2>
  مع فارق أنه في خطوة أمر `waf configure` عليك أيضا تفعيل دعم Sixel بإضافة الخيار
  `--enable-sixel` للأمر الأساسي.
- افتح طرفية mlterm بتشغيل الأمر `mlterm` من طرفية MSYS2.
- يمكنك الآن تشغيل الأنمي المفضل بأمر مثل التالي (انظر تعليمات لينكس حول الخيارات):
{% highlight plaintext %}
mpv --vo=sixel --profile=sw-fast --really-quiet anime.mp4
{% endhighlight %}
- يبدو أن واجهة mpv الرسومية الافتراضية لا تعمل مع وضع Sixel في ويندوز، لذلك قد تحتاج لاستخدام بعض الخيارات
  قبل تشغيل الفيديو لكي تختار ملف الترجمة أو الصوت (إذا كان الفيديو يتضمن أكثر من ترجمة أو صوت). يمكن استخدام خيارات `--aid` و `--sid` لتحقيق ذلك:
{% highlight plaintext %}
mpv --vo=sixel --aid=2 --sid=3 anime.mp4
{% endhighlight %}

{% include image.html file="mlterm-windows.png"
   caption="مشاهدة الأنمي من سطر الأوامر في ويندوز"
%}


## خاتمة

أرجو أن يكون هذا الشرح مفيدا. مشاهدة ممتعة!

[^1]: <https://mesonbuild.com/Getting-meson.html#installing-meson-with-pip>

[^2]: <https://github.com/mpv-player/mpv#meson>

[^3]: انظر <https://mpv.io/manual/master/#video-output-drivers-sixel> لقائمة الخيارات المتعلقة بـ Sixel.

[^4]: اعتراف خطير: كاتب هذه المقالة كتب المقالة في ويندوز 10.
