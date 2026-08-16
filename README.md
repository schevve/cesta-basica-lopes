# Cesta Básica Lopes — Sistema de Força de Vendas

Sistema de gestão de força de vendas desenvolvido para a **Cesta Básica Lopes**, empresa especializada na venda porta a porta de cestas básicas na região de Toledo (PR) e cidades vizinhas.

O sistema substitui o controle manual feito por fichas e planilhas Excel, oferecendo maior organização, controle de clientes, vendas parceladas e estoque dos vendedores ambulantes.

---

## 📋 Sobre o Projeto

Este é um **Sistema de Força de Vendas (SFA)** focado na operação de venda porta a porta.

### Principais problemas resolvidos:

- Controle manual por fichas e planilhas (cerca de 4h diárias de lançamentos)
- Falta de visibilidade sobre clientes inadimplentes e score de crédito
- Dificuldade de organização das rotas/visitas dos vendedores
- Risco de erros no controle de recebimentos

---

## ✨ Funcionalidades Principais

### App Mobile (Vendedores)

- Carteira de visitas do dia
- Cadastro e consulta de clientes
- Registro de vendas e parcelas
- Recebimento de pagamentos (Pix, cartão, dinheiro, vale-alimentação)
- Agendamento automático da próxima visita
- Visualização de histórico e score do cliente
- Bloqueio de clientes com parcelas em atraso

---

## 🛠️ Tecnologias

| Camada     | Tecnologia   | Descrição                         |
| ---------- | ------------ | --------------------------------- |
| Backend    | **Supabase** | PostgreSQL + Auth + Storage + RLS |
| App Mobile | **Flutter**  | Aplicativo para os vendedores     |

---

## 📁 Estrutura do Repositório

```text
cesta-basica-lopes/
├── app/                    # Aplicativo Flutter
├── supabase/               # Migrations, seeds e configurações
│   ├── migrations/
│   └── seed.sql
└── README.md
```

## 🚀 Como executar

### Pré-requisitos

- Flutter SDK
- Node.js 18+
- Conta no [Supabase](https://supabase.com)

### 1. Configurar o Supabase

1. Crie um novo projeto no Supabase
2. Execute as migrations da pasta `supabase/migrations`
3. Configure as variáveis de ambiente

### 2. App Mobile (Flutter)

```bash
cd app
flutter pub get
flutter run
```

## 🗃️ Modelagem do Banco (visão geral)

Principais entidades:

- users (vendedores e administradores)
- clientes
- vendas
- parcelas
- visitas
- produtos / estoque
- cidades / preços

A modelagem completa está na pasta supabase/migrations.

## 👥 Equipe

Projeto desenvolvido como trabalho acadêmico.

## 📄 Licença

Este projeto foi desenvolvido para uso da Cesta Básica Lopes.
Todos os direitos reservados.
