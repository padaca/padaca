== padaca

Projekt im Rahmen des Moduls Software-Engineering.

Demo-Mode:

```bash
export SECRET_KEY_BASE=$(rake secret) RAILS_SERVE_STATIC_FILES=1 RAILS_ENV=production
rake db:setup 
rails server
```
