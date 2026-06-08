# Vdemy

A full-stack online course marketplace built with Ruby on Rails 8. Users can browse and purchase courses, watch video lessons, and track their learning progress. Admins can manage the full course catalog through a dedicated admin panel.

**Live demo:** `[LIVE_URL]`

---

## Features

- **Authentication** — session-based login, registration, and password reset via email
- **Course discovery** — browse published courses filtered by category and level
- **Enrollments** — enroll in free courses instantly
- **Payments** — purchase paid courses via Stripe Checkout
- **Lesson player** — watch video lessons with a chapter sidebar
- **Admin panel** — full CRUD for courses, chapters, and lessons
- **SEO-friendly URLs** — powered by FriendlyId slugs

## Tech stack

| Layer | Technology |
|---|---|
| Framework | Ruby on Rails 8.1 |
| Database | PostgreSQL |
| Frontend | Tailwind CSS v4, Hotwire (Turbo + Stimulus) |
| Payments | Stripe Checkout |
| File storage | Active Storage (disk / S3-ready) |
| Auth | Rails 8 built-in authentication generator |
| Testing | Minitest + Capybara |
| Linting | RuboCop Rails Omakase |
| Deployment | Kamal |

---

## Getting started

### Prerequisites

- Ruby 3.4+
- PostgreSQL
- Node.js (for Tailwind CSS build)

### Setup

```bash
git clone https://github.com/<your-username>/vdemy.git
cd vdemy

bundle install
cp .env.example .env        # add your Stripe keys
bin/rails db:create db:migrate db:seed
bin/dev
```

Visit `http://localhost:3000`

### Environment variables

| Variable | Description |
|---|---|
| `STRIPE_SECRET_KEY` | Stripe secret key (test: `sk_test_...`) |
| `STRIPE_PUBLISHABLE_KEY` | Stripe publishable key (test: `pk_test_...`) |

---

## Test credentials

Use these on the live demo or locally after `db:seed`:

| Role | Email | Password |
|---|---|---|
| Admin | `admin@example.com` | `password` |
| Student | `student@example.com` | `password` |

### Stripe test card

| Field | Value |
|---|---|
| Card number | `4242 4242 4242 4242` |
| Expiry | Any future date |
| CVC | Any 3 digits |

---

## Running tests

```bash
bin/rails test              # unit + integration tests
bin/rails test:system       # system tests (Capybara)
bin/rubocop                 # linter
```

---

## Project structure

```
app/
├── controllers/
│   ├── admin/              # Admin panel (courses, chapters, lessons, dashboard)
│   ├── sessions_controller.rb
│   ├── registrations_controller.rb
│   ├── discover_controller.rb
│   ├── enrollments_controller.rb
│   ├── lessons_controller.rb
│   └── payments_controller.rb
├── models/
│   ├── user.rb             # Roles: student, admin
│   ├── course.rb           # Categories, levels, FriendlyId
│   ├── chapter.rb
│   ├── lesson.rb           # Active Storage video/image attachments
│   ├── enrollment.rb
│   └── payment.rb          # Stripe session tracking
└── views/
    ├── admin/
    ├── discover/
    └── lessons/
```

---

## License

MIT
