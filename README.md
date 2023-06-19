# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of learning Rails by example.
Students are required to create and modify routes on top of existed codebase.

## Features

### Landing page shows all items

![](/docs/landing.gif)

### User can register, login / logout

![](/docs/login.png)
![](/docs/register.png)

### User can navigate to different categories

![](/docs/show-by-categories.gif)

### User can add items to cart, then pays for the selected items by Stripe

![](/docs/payment.gif)

### User can review order details

![](/docs/order.gif)

### Sold out items are indicated by a tag, and cannot be added to cart

![](/docs/sold-out-tag.png)

### To access admin pages, http-auth is required

![](/docs/http-auth.png)

### Admin pages allow editing categories and products

![](/docs/admin.gif)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
