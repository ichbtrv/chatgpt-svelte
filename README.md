# Another SvelteKit ChatGPT UI

Video Link: https://ivanprojects.s3.us-west-1.amazonaws.com/Screen+Recording+2023-03-10+at+10.11.18+AM.mov

![](https://i.imgur.com/gKu0MbX.png)

## Features
 - Formatted Markdown Responses
 - Persisted Chat History (Setup for local storage but able to be adapted)
 - Auto Scrolling/Message streaming
 
## Using the App
1. pnpm Install
2. Add an OPENAI_KEY to an .env file with your open ai key
3. Enjoy


## Stores
- Chat Messages 
- Chat Messages (Derived)
- Answer
- Chat History

### Chat Messages
The chat messages store stores the transcript for the current active conversation. 
When a question is submitted it posts to the api endpoint and if it gets a 200 starts to stream the answer.

**Answer Store**
The answer store is what holds answer being streamed. While the AI is typing the answer store is being updated, and when the response is 'DONE' the answer is appended to the active transcript and reset to a blank string. 

The use of two separate stores allows for a single update to the entire transcript, error checking prior to updating and for there to be no visible difference in the UI when streaming the answer. 

### Chat Messages (Derived)
The derived Chat Messages store gets the active conversation starting with the first query and checks to see if there is a 'chatHistory' key in local storage. This store acts as the bridge between the history store and the chat messages store. If there isn't any history in local storage, it creates a key and updates it if there is a query. Once the answer store finishes streaming the answer and updates the original Chat messages store, the derived store updates the key with updated transcript

### Chat history 
The Chat history store holds the references to all the various conversations held in local storage. On clicking one it'll update the chat view to display the active transcript. 
It also handles deleting any of the keys. The Chat history store is set by the derived store, since it is dependant on the existance of messages, the change in those messages, and the existance of a history in local storage. 




