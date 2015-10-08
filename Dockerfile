FROM ruby:2.2.3-onbuild

EXPOSE 4567

ENTRYPOINT ["ruby"]
CMD ["app.rb"]