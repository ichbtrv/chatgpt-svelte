import GPT3Tokenizer from 'gpt3-tokenizer'

const tokenizer = new GPT3Tokenizer({ type: 'gpt3' })

export const getTokens = (input: string): number => {
	const tokens = tokenizer.encode(input)
	return tokens.text.length
}