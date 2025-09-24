
/*
TITULO     : Controle de Caixa - Versao 3.20030922
DATA       : 22/09/03
PROGRAMA   : NOVOCARQ.PRG
COMENTARIO : CRIACAO DE ARQUIVOS
*/
 
#include "NOVOC.CH"
#include "NOVOCMOU.CH"

FUNCTION CRIARQ
//
// -> Funcao que cria banco de dados (arquivos "DBF")
LOCAL ESTRU_DBF
**
**BI [INI] ARQ.B01
**BI [FIM] ARQ.B01
**
IF !FILE( "CADCLI.DBF" )
   ESTRU_DBF := {}
   AADD( ESTRU_DBF, { "CODIGO", "C", 4, 0 } )
   AADD( ESTRU_DBF, { "RAZAO", "C", 40, 0 } )
   AADD( ESTRU_DBF, { "ENDERECO", "C", 34, 0 } )
   AADD( ESTRU_DBF, { "BAIRRO", "C", 25, 0 } )
   AADD( ESTRU_DBF, { "CIDADE", "C", 20, 0 } )
   AADD( ESTRU_DBF, { "ESTADO", "C", 9, 0 } )
   AADD( ESTRU_DBF, { "CNPJ", "C", 18, 0 } )
   AADD( ESTRU_DBF, { "TELEFONES", "C", 30, 0 } )
   AADD( ESTRU_DBF, { "ATIVOINATI", "C", 1, 0 } )
   DBCREATE( "CADCLI", ESTRU_DBF )
ENDIF
IF !FILE( "MOVIMENT.DBF" )
   ESTRU_DBF := {}
   AADD( ESTRU_DBF, { "NORECIBO", "C", 10, 0 } )
   AADD( ESTRU_DBF, { "VENCIMENTO", "D", 8, 0 } )
   AADD( ESTRU_DBF, { "RECEBIMENT", "D", 8, 0 } )
   AADD( ESTRU_DBF, { "CLIENTE", "C", 4, 0 } )
   AADD( ESTRU_DBF, { "RAZAO", "C", 40, 0 } )
   AADD( ESTRU_DBF, { "SERVICO1", "C", 3, 0 } )
   AADD( ESTRU_DBF, { "VLRSERV1", "N", 9, 2 } )
   AADD( ESTRU_DBF, { "SERVICO2", "C", 3, 0 } )
   AADD( ESTRU_DBF, { "VLRSERV2", "N", 9, 2 } )
   AADD( ESTRU_DBF, { "SERVICO3", "C", 3, 0 } )
   AADD( ESTRU_DBF, { "VLRSERV3", "N", 9, 2 } )
   AADD( ESTRU_DBF, { "SERVICO4", "C", 3, 0 } )
   AADD( ESTRU_DBF, { "VLRSERV4", "N", 9, 2 } )
   AADD( ESTRU_DBF, { "SERVICO5", "C", 3, 0 } )
   AADD( ESTRU_DBF, { "VLRSERV5", "N", 9, 2 } )
   AADD( ESTRU_DBF, { "SERVICO6", "C", 3, 0 } )
   AADD( ESTRU_DBF, { "VLRSERV6", "N", 9, 2 } )
   AADD( ESTRU_DBF, { "TSERVICOS", "N", 11, 2 } )
   AADD( ESTRU_DBF, { "BAIXADO", "C", 1, 0 } )
   DBCREATE( "MOVIMENT", ESTRU_DBF )
ENDIF
IF !FILE( "SERVICOS.DBF" )
   ESTRU_DBF := {}
   AADD( ESTRU_DBF, { "CODIGO", "C", 3, 0 } )
   AADD( ESTRU_DBF, { "DESCRICAO", "C", 25, 0 } )
   DBCREATE( "SERVICOS", ESTRU_DBF )
ENDIF
**
**BI [INI] ARQ.B02
**BI [FIM] ARQ.B02
**
 
/* Final do programa NOVOCARQ.PRG */