# rails-sidekiq-code-snippets

A Rails app that manages a library of code snippets and uses Sidekiq workers to
apply syntax highlighting.

Based on the tutorial found at http://railscasts.com/episodes/366-sidekiq.

## How to use

#### Clone the repo

```
git clone git@github.com:thinkswan/rails-sidekiq-code-snippets.git
```

#### Install Redis

If you're using Homebrew:

```
brew install redis
redis-server /usr/local/etc/redis.conf
```

If you prefer to install from source:

* http://redis.io/download#installation

#### Install gems and set database up

```
gem install foreman
bundle install
bin/rake db:setup
```

#### Start server and Sidekiq workers

```
foreman start
```

This will start a server at http://localhost:3000.

To monitor the Sidekiq workers, open http://localhost:3000/sidekiq in a separate
tab.

![Sidekiq web admin](https://cloud.githubusercontent.com/assets/338259/8619814/502d981a-2744-11e5-99cd-38743140e038.jpg)

## How it works

The Rails app is a basic CRUD application that allows you to manage code
snippets. It is backed by an SQLite3 database.

When you create or modify a snippet, a Sidekiq worker (`SnippetHighlighter`) is
enqueued. This worker sends the code snippet and specified language to a [public
syntax highlighting API](http://markup.su/highlighter/api) and saves the result
when finished.

Note that when you first create or modify a snippet, you will see the plain
code when the request completes. This is because the syntax highlighting job has
not been picked off the queue yet.

![Code snippet (no syntax highlighting)](https://cloud.githubusercontent.com/assets/338259/8619819/5fea4f82-2744-11e5-9a0b-9d8793e06634.jpg)

Once a worker finishes the job, you can refresh the page to see the
syntax highlighted version of the snippet.

![Code snippet (with syntax highlighting)](https://cloud.githubusercontent.com/assets/338259/8619811/4d77b4de-2744-11e5-87c2-9c277f358017.jpg)

## License

MIT
