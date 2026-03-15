Instagram Feed Clone (Flutter)

Overview

This project is a Flutter implementation of an Instagram-style home feed.
The application displays a scrolling list of posts with image carousels, basic interactions, and loading placeholders. The goal was to replicate the behavior and UI of a social media feed while ensuring smooth performance and clean architecture.

---

Features

- Instagram-style feed UI
- Image carousel inside posts
- Pinch-to-zoom image interaction
- Like and Save toggle actions
- Infinite scrolling feed
- Shimmer loading placeholder
- Cached network images for better performance

---

State Management

This project uses Provider for state management.

Provider was chosen because it is a lightweight and efficient solution recommended by Flutter for managing application state. It helps separate the UI from business logic and allows widgets to rebuild only when the underlying data changes.

The "PostProvider" is responsible for:

- Fetching post data
- Managing the list of posts
- Handling pagination for infinite scrolling
- Notifying the UI when new data is available

Widgets listen to updates using "Consumer<PostProvider>" which ensures only the necessary widgets rebuild.

---

Project Structure

lib/

models/
Contains the Post data model.

providers/
Handles state management and data logic.

screens/
Contains application screens such as the Home feed.

widgets/
Reusable UI components like PostCard and ShimmerPost.

---

Packages Used

- provider
- cached_network_image
- shimmer
- photo_view

---

How to Run the Project

1. Clone the repository

git clone https://github.com/Ayushnag624/Instagram-feed-clone.git

2. Navigate to the project folder

cd instagram-feed-clone

3. Install dependencies

flutter pub get

4. Run the application

flutter run

---

Demo

A screen recording demonstrating the app functionality is included with the submission.

The demo shows:

- Feed loading using shimmer placeholders
- Infinite scrolling feed
- Image carousel inside posts
- Pinch-to-zoom interaction
- Like and Save actions

---

Notes

Images are loaded from public URLs and cached using "cached_network_image" to improve loading performance and reduce repeated network calls.