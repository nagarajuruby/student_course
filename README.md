##### Prerequisites

The setups steps expect following tools installed on the system.

- Ruby: 3.1.2
- Rails: 6.1.7.2
- pg: 1.4.5

##### 1. Check out the repository

```bash
git clone git@github.com:nagarajuruby/student_course.git
```

##### 2. Create database.yml file

Copy the sample .env.sample file and edit the database configuration as required.

```bash
cp .env.sample .env
```

##### 3. Create and setup the database

Run the following commands to create and setup the database.

```ruby
rails db:create
rails db:migrate
```

##### 4. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```

And now you can visit the site with the URL http://localhost:3000
