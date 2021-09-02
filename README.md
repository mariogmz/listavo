# Listavo

## Create admin user first time the app boot

```ruby
Admin.create(
  email: "admin@test.com",
  name: "Super Admin",
  password: "test123!",
  password_confirmation: "test123!",
)
```
