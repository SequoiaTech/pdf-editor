# Use an official Node.js image with a compatible version
FROM node:22.12.0

# Set working directory
WORKDIR /app

# Copy package.json and yarn.lock first for dependency caching
COPY package.json yarn.lock ./

# Optional: use corepack to enable yarn
RUN corepack enable

# Install dependencies
RUN yarn install --frozen-lockfile

# Copy the rest of the app
COPY . .

# Build the app (if you're using something like SvelteKit/Vite)
RUN yarn build

# Expose port (adjust according to your app)
EXPOSE 4173

# Start your app (adjust this for your framework)
CMD ["yarn", "preview"]