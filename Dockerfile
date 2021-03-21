FROM jekyll/jekyll
COPY . /srv/jekyll
EXPOSE 4000
CMD ["jekyll", "serve", "--livereload", "--trace"]
