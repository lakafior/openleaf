FROM node:22

# Install pnpm globally
RUN npm install -g pnpm

# Create app directory
WORKDIR /app

# Copy package files and install dependencies
COPY package.json pnpm-lock.yaml* ./
RUN pnpm install --frozen-lockfile

# Copy remaining project files
COPY . .

# Build Next.js app
RUN pnpm build

# Expose desired port (change if needed)
EXPOSE 1133

# Start the app
CMD ["pnpm", "start"]
