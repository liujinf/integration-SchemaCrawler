# Interactive Shell with ChatGPT

SchemaCrawler is integrated with ChatGPT to provide an interactive way to interrogate your database schema metadata. No information about your database schema is shared with OpenAI. To start using this integration, you will need to create your own [OpenAI API key](https://www.howtogeek.com/885918/how-to-get-an-openai-api-key/). Once you have that, use SchemaCrawler from the command-line as you normally would, and connect to your database. Provide `chatgpt` as the SchemaCrawler command, and use an additional command-line argument, `--api-key` to provide your API key. If you do not want to provide this API key in the clear, you can use `--api-key:env` instead, and give the name of an environmental variable that contains the key.

Once you have this running, you will have an interactive chat shell with ChatGPT, enhanced with information about your database metadata. You can try prompts such as the following ones:

- List all tables
- Describe the AUTHORS table
- What are the indexes on the AUTHORS table?
- What are the AUTHORS columns?
- What is the AUTHORS primary key?
- Describe the AuthorsList view
- Show me the triggers on AUTHORS
- Find the parents of BOOKAUTHORS
- What are the children of BOOKS?

To quit the console, you can type something like:

- I think I have everything I need
- or simply, "done", "exit" or "quit"
  
You can use any language that ChatGPT supports, for example, try something like:

- Combien de tables y a-til dans cette base de données?
- Décris-moi la table Books
- Y'a t-il une clé primaire?
- Décris-moi la table NoName


## Get Summary and Help on the Schema

If you are willing to share your database metadata with OpenAI, you can get additional help from ChatGPT. For example, you can summarize what the database does, get help with writing SQL queries, or with writing good comments on your database schema. To share data, pass an additional command-line argument to SchemaCrawler, `--use-metadata`. Please note that depending on your database schema, this can exceed the maximum tokens allowed by ChatGPT. If you end up exceeding the tokens, either do not use this flag, or use the SchemaCrawler command-line to limit the tables in scope using regular expressions.

Try out prompts like (even though they may not return completely accurate information):

- Summarize the database in one paragraph
- Based on my schema, write a SQL query for book names and author names
- Based on my schema, write a SQL query to find all books that have previous editions
- Suggest remarks for columns that do not have them


## Extensions

SchemaCrawler allows you to extend the functionality with your own functions that work against the database catalog. Your functions should implement `schemacrawler.tools.command.chatgpt.functions.FunctionDefinition<P extends FunctionParameters>`. Package your functions in a jar, with a service provider file called `META-INF/services/schemacrawler.tools.command.chatgpt.functions.FunctionDefinition`. Put this jar on the SchemaCrawler classpath, and your functions will be provided to ChatGPT for processing.
