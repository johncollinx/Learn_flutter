# -----------------------------
# Flutter Dev Container (Ubuntu)
# -----------------------------
FROM ubuntu:22.04

# Install basic dependencies
RUN apt-get update && apt-get install -y \
  curl git unzip xz-utils zip libglu1-mesa \
  && rm -rf /var/lib/apt/lists/*

# Install Flutter SDK
RUN git clone https://github.com/flutter/flutter.git -b stable /usr/local/flutter

# Add Flutter and Dart to PATH
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Pre-download Flutter dependencies
RUN flutter doctor -v

# Set working directory (where VS Code mounts the project)
WORKDIR /workspace

CMD [ "bash" ]
