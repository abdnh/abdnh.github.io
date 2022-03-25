https://abdnh.github.io/

My personal blog in Arabic. Built with Jekyll.

## Build Instructions

I deploy the site using an [action](.github/workflows/gh-pages.yml),
and don't use Github-provided Jekyll setup because
some of the plugins I need are not whitelisted.

Some notes about building the site on Windows (mostly for my future self)
because that's what I normally use and because it's apparently more pain
than other platforms:

1. Install Ruby from [RubyInstaller](https://rubyinstaller.org/downloads/).
  Make sure to select the Ruby+Devkit build if you don't have an existing MSYS2 setup.
2. Install Jekyll and Bundler using `gem install jekyll bundler`.
3. Install site dependencies: `bundle install`.
4. Build the site: `bundle exec jekyll build`.

NOTE: Setting up Jekyll on WSL is easier but it has some issues like broken filesystem watching,
and it's painfully slow (My plain site takes about 12s to build on WSL, while it only takes ~1.5s on MSYS2).

## License

The site is licensed under the [Creative Commons public domain (CC-0)](https://creativecommons.org/publicdomain/zero/1.0/) license.

The RSS and code icons are taken from the [Bootstrap Icons](https://icons.getbootstrap.com/) project and licensed under the MIT license.
