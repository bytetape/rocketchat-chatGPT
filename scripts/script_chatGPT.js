let fetch;
import('node-fetch').then(module => fetch = module.default);

const API_ENDPOINT = "https://api.openai.com/v1/chat/completions";
const API_KEY = "YOUR API KEY";
const MODEL = "gpt-3.5-turbo";
const maxDialogueCount = 10; // 传递给机器人的最大对话条数。
const maxDialogueLength = 1000; // 传递给机器人的最大对话字符数。
let chat_history = {};

// 获取chatGPT回复信息
async function getChatResponse(user, message_text) {
  if (!chat_history[user]) {
    chat_history[user] = [];
  }

  addElement(user, message_text);
  let logs = chat_history[user].join("\n");
  logs = logs.slice(-maxDialogueLength);

  const response = await fetch(API_ENDPOINT, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      "Authorization": `Bearer ${API_KEY}`,
    },
    body: JSON.stringify({
      model: MODEL,
      messages: [{ role: "assistant", content: logs }],
      temperature: 0.7,
    }),
  });

  const data = await response.json();

  if (!data.choices || data.choices.length === 0) {
    throw new Error(`API返回的数据不包含可用信息\nresponse_text: ${JSON.stringify(response)}`);
  }
  const response_text = data.choices[0].message.content.trim();
  addElement(user, response_text);

  return response_text;
}

function addElement(user, element) {
  if (chat_history[user].length >= maxDialogueCount) {
    chat_history[user].shift();
  }
  chat_history[user].push(element);
}

module.exports = (robot) => {
  async function handleChatRequest(res) {
    try {
      const { text, message } = res;
      const input = message && message.text ? message.text.slice(6).trim() : '';
      const userName = message && message.user && message.user.name ? message.user.name : '';

      const reply = await getChatResponse(userName, input);
      res.reply(`${reply}`);

    } catch (error) {
      console.error(error);
      res.reply('Oops, something went wrong!\n' + error);
    }
  }

  robot.respond(/(.*)/i, handleChatRequest);
};
