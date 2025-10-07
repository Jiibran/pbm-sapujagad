# SapuJagad Monorepo

A professional Flutter monorepo for SapuJagad, containing three main modules:

- **User App (`user_app`)**: For customers to book cleaning and home services.
- **Tasker App (`tasker_app`)**: For cleaning partners (Taskers) to manage jobs and schedules.
- **Admin Dashboard (`admin_dashboard`)**: Web dashboard for admin operations and management.

## Shared Packages
- **shared_models**: Common data models.
- **shared_services**: Shared business logic and services.
- **shared_ui**: Reusable UI components.

## Setup Instructions

1. Install Flutter (stable) and ensure `flutter` is on PATH.
2. From the repo root, run dependencies for each package/app:
   - `cd shared_models ; flutter pub get` (or `dart pub get`)
   - `cd shared_services ; dart pub get`
   - `cd shared_ui ; flutter pub get`
   - `cd user_app ; flutter pub get`
   - `cd tasker_app ; flutter pub get`
   - `cd admin_dashboard ; flutter pub get` (and enable web: `flutter config --enable-web` if needed)

## Run
- User App: `cd user_app ; flutter run`
- Tasker App: `cd tasker_app ; flutter run`
- Admin Dashboard (web): `cd admin_dashboard ; flutter run -d chrome`

## Testing
- Run tests per module, e.g. `cd shared_services ; dart test` or `cd user_app ; flutter test`.

---

For more details, see each module's README.
