import { sveltekit } from '@sveltejs/kit/vite';
import adapter from '@sveltejs/adapter-vercel';
import { defineConfig } from 'vitest/config';

export default defineConfig({
	plugins: [sveltekit()],
	test: {
		include: ['src/**/*.{test,spec}.{js,ts}']
	}
});
