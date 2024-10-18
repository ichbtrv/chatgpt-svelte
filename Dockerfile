# Build the first stage with alpine node image and name as build
FROM node:18-alpine AS base
ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable
WORKDIR /app
COPY package.json .
COPY pnpm-lock.yaml .


FROM base AS build
COPY . .
RUN pnpm install && pnpm run build

FROM base AS prod-deps
RUN pnpm install --prod

FROM base
COPY --from=build /app/package.json .
COPY --from=build /app/build build
COPY --from=prod-deps /app/node_modules ./node_modules
EXPOSE 8080
ENV HOST=0.0.0.0 PORT=8080 NODE_ENV=production

CMD ["pnpm", "serve"]