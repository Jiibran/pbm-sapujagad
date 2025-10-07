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

## Run & Preview the Apps

You can launch each experience locally to inspect the UI and behaviour:

1. Make sure you have at least one Flutter device available (`flutter devices`).
   - For mobile, start an Android emulator or connect a physical device with USB debugging enabled.
   - For the web dashboard, ensure `flutter config --enable-web` has been executed once, and Chrome is installed.
2. From the repo root, run the desired target:
   - **User App (mobile)**: `cd user_app && flutter run`
   - **Tasker App (mobile)**: `cd tasker_app && flutter run`
   - **Admin Dashboard (web)**: `cd admin_dashboard && flutter run -d chrome`

Flutter hot-reload/hot-restart works as usual, so changes to the Dart code will be reflected immediately while the command is running.

### Importing the Monorepo on Zapp

Zapp expects a single Flutter project at the repository root. Because this workspace is a Melos monorepo, the included `zapp.yaml` file lists each app directory. When you import the repository into Zapp you can pick the `user_app`, `tasker_app`, or `admin_dashboard` targets from the project selector without extra configuration.

## Testing
- Run tests per module, e.g. `cd shared_services ; dart test` or `cd user_app ; flutter test`.

---

For more details, see each module's README.
