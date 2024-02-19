# Baixar o projeto do GIT
 Ao baixar o repositório git clone https://github.com/yaraviana/Teste.git, é necessário ajustar as seguintes linhas nos arquivos cadastro.robot, compra.robot e login.robot localizado na pasta PageObjetive:

Resource         C:/TesteTec/ProjetoTecnico/Resources/cadastro_resource.robot
Resource         C:/TesteTec/ProjetoTecnico/Resources/login_resources.robot

Para refletir o novo local onde você baixou o repositório, altere essas linhas para o caminho atual do projeto. Por exemplo, se o repositório foi baixado na pasta C:\caminho\para\seu\diretorio\Teste, as linhas seriam ajustadas para:

Resource         C:/caminho/para/seu/diretorio/Teste/Resources/cadastro_resource.robot
Resource         C:/caminho/para/seu/diretorio/Teste/Resources/login_resources.robot


# Automação de Testes

Este projeto contém testes automatizados para a funcionalidade de Login e Compra e Cadastro no site [http://www.automationpractice.pl](http://www.automationpractice.pl).

## Configuração do Ambiente

1. Instale o Python: [https://www.python.org/downloads/](https://www.python.org/downloads/)
2. Instale o Robot Framework: pip install robotframework
3. Instale as bibliotecas adicionais: pip install robotframework-seleniumlibrary
	pip install robotframework-faker
4. Instale o pacote: pip install setuptools


## Estrutura do Projeto

- Testes: Contém os cenários de teste BDD.
- Resources: Armazena os Page Objects.
- Screenshots: Armazena os screenshots tirados durente a execução dos testes
- keywords: Contém palavras-chave comuns.
- README.md: Instruções de configuração e execução.

## Execução dos testes
No cmd navegue até a pasta onde foi baixado o projeto

1.Dê o comando robot login.robot para executar todos os cenários de login
	Executar apenas um teste específico da suíte
		robot -i Login_senha_invalida login.robot
		robot -i Login_com_sucesso login.robot

2.Dê o comando robot compra.robot para executar todos os cenários de compra
	Executar apenas um teste específico da suíte
		robot -i Comprar compra.robot

2.Dê o comando robot cadastro.robot para executar todos os cenários de cadastro
	Executar apenas um teste específico da suíte
		robot -i Cadastrar_com_sucesso cadastro.robot
		robot -i Cadastrar_email_invalido cadastro.robot
		robot -i Cadastrar_Senha_Invalida cadastro.robot

