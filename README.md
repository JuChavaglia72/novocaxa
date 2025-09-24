  MIRO 3.0 - DOCUMENTA€ŽO DO SISTEMA
  ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
 
  SISTEMA : NOVOC
  TITULO  : Controle de Caixa - Versao 3.20030922                                           
 
 
  ARQUIVOS
  ÍÍÍÍÍÍÍÍ
 
  AREA      : 1
  ARQUIVO   : CADCLI.DBF
 
  CAMPO       TIPO      TAMANHO  DECIMAIS  DESCRICAO
  ÄÄÄÄÄÄÄÄÄÄ  ÄÄÄÄÄÄÄÄ  ÄÄÄÄÄÄÄ  ÄÄÄÄÄÄÄÄ  ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
  CODIGO      CARACTER        4         0                                     
  RAZAO       CARACTER       40         0                                     
  ENDERECO    CARACTER       34         0                                     
  BAIRRO      CARACTER       25         0                                     
  CIDADE      CARACTER       20         0                                     
  ESTADO      CARACTER        9         0                                     
  CNPJ        CARACTER       18         0                                     
  TELEFONES   CARACTER       30         0                                     
  ATIVOINATI  CARACTER        1         0                                     
 
  INDICE    : CADCL001.NTX
  EXPRESSAO : CNPJ
  ORDEM     : 1
 
  INDICE    : CADCL002.NTX
  EXPRESSAO : CODIGO
  ORDEM     : 2
 
  INDICE    : CADCL003.NTX
  EXPRESSAO : RAZAO
  ORDEM     : 3
  ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
 
 
 
  AREA      : 2
  ARQUIVO   : MOVIMENT.DBF
 
  CAMPO       TIPO      TAMANHO  DECIMAIS  DESCRICAO
  ÄÄÄÄÄÄÄÄÄÄ  ÄÄÄÄÄÄÄÄ  ÄÄÄÄÄÄÄ  ÄÄÄÄÄÄÄÄ  ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
  NORECIBO    CARACTER       10         0                                     
  VENCIMENTO  DATA            8         0                                     
  RECEBIMENT  DATA            8         0                                     
  CLIENTE     CARACTER        4         0                                     
  RAZAO       CARACTER       40         0                                     
  SERVICO1    CARACTER        3         0                                     
  VLRSERV1    NUMERICO        9         2                                     
  SERVICO2    CARACTER        3         0                                     
  VLRSERV2    NUMERICO        9         2                                     
  SERVICO3    CARACTER        3         0                                     
  VLRSERV3    NUMERICO        9         2                                     
  SERVICO4    CARACTER        3         0                                     
  VLRSERV4    NUMERICO        9         2                                     
  SERVICO5    CARACTER        3         0                                     
  VLRSERV5    NUMERICO        9         2                                     
  SERVICO6    CARACTER        3         0                                     
  VLRSERV6    NUMERICO        9         2                                     
  TSERVICOS   NUMERICO       11         2                                     
  BAIXADO     CARACTER        1         0                                     
 
  INDICE    : MOVIM004.NTX
  EXPRESSAO : CLIENTE
  ORDEM     : 1
 
  INDICE    : MOVIM005.NTX
  EXPRESSAO : DTOS(VENCIMENTO)
  ORDEM     : 2
 
  INDICE    : MOVIM006.NTX
  EXPRESSAO : MES_ANO(RECEBIMENT)
  ORDEM     : 3
 
  INDICE    : MOVIM007.NTX
  EXPRESSAO : MES_ANO(VENCIMENTO)+RAZAO
  ORDEM     : 4
 
  INDICE    : MOVIM008.NTX
  EXPRESSAO : NORECIBO
  ORDEM     : 5
 
  INDICE    : MOVIM009.NTX
  EXPRESSAO : RAZAO
  ORDEM     : 6
  ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
 
 
 
  AREA      : 3
  ARQUIVO   : SERVICOS.DBF
 
  CAMPO       TIPO      TAMANHO  DECIMAIS  DESCRICAO
  ÄÄÄÄÄÄÄÄÄÄ  ÄÄÄÄÄÄÄÄ  ÄÄÄÄÄÄÄ  ÄÄÄÄÄÄÄÄ  ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
  CODIGO      CARACTER        3         0                                     
  DESCRICAO   CARACTER       25         0                                     
 
  INDICE    : SERVI010.NTX
  EXPRESSAO : CODIGO
  ORDEM     : 1
 
  INDICE    : SERVI011.NTX
  EXPRESSAO : DESCRICAO
  ORDEM     : 2
  ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
 
 
 
 
  SISTEMA NOVOC - MODULOS (PRG)
  ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
 
  ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
  ³     Modulo     ³           Descricao           ³
  ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  ³ NOVOC.PRG      ³ Modulo principal              ³
  ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  ³ NOVOCfu1.PRG   ³ Modulo de funcoes - Parte I   ³
  ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  ³ NOVOCfu2.PRG   ³ Modulo de funcoes - Parte II  ³
  ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  ³ NOVOCfu3.PRG   ³ Modulo de funcoes - Parte III ³
  ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  ³ NOVOCarq.PRG   ³ Rotina de criacao de arquivos ³
  ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  ³ NOVOCsos.PRG   ³ Rotinas de help               ³
  ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  ³ NOVOCinc.PRG   ³ Menu de cadastros             ³
  ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  ³ NOVOCi01.PRG   ³ Clientes                      ³
  ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  ³ NOVOCi02.PRG   ³ Servicos                      ³
  ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  ³ NOVOCi03.PRG   ³ Movimentos                    ³
  ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  ³ NOVOCcon.PRG   ³ Menu de manuten‡”es           ³
  ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  ³ NOVOCc01.PRG   ³ Clientes                      ³
  ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  ³ NOVOCc02.PRG   ³ Servicos                      ³
  ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  ³ NOVOCc03.PRG   ³ Movimentos                    ³
  ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  ³ NOVOCrel.PRG   ³ Menu de relatorios            ³
  ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  ³      -=-       ³ Clientes                      ³
  ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  ³ NOVOCr02.PRG   ³ Alfabetica                    ³
  ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  ³ NOVOCr03.PRG   ³ Numerica                      ³
  ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  ³      -=-       ³ Servicos                      ³
  ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  ³ NOVOCr05.PRG   ³ Alfabetica                    ³
  ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  ³ NOVOCr06.PRG   ³ Numerica                      ³
  ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  ³      -=-       ³ Movimentos                    ³
  ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  ³ NOVOCr98.PRG   ³ Em.de Rec.- Data              ³
  ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  ³ NOVOCr08.PRG   ³ Em.de Rec.- Geral             ³
  ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  ³ NOVOCr09.PRG   ³ Em.de Rec.- Avulso            ³
  ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  ³ NOVOCr99.PRG   ³ Em.de Rec.- Cliente           ³
  ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  ³ NOVOCr10.PRG   ³ Rec.Baixados                  ³
  ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  ³ NOVOCr11.PRG   ³ Rec.Em Aberto                 ³
  ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  ³      -=-       ³ Especiais                     ³
  ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  ³ NOVOCr13.PRG   ³ Fluxo de Caixa                ³
  ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
 
 
 
  CONFIGURACAO DO SISTEMA
  ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
 
- Linguagem
 
  ÚÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿  ÚÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
  ³ û ³ Clipper 5.01 ³  ³   ³ Clipper 5.2 ³
  ÀÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ  ÀÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
 
 
- Tratamento de arquivos
 
  ÚÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄ¿  ÚÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
  ³ û ³ Monousuario ³  ³   ³ Multiusuario ³
  ÀÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÙ  ÀÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
 
 
- Endentacao 
 
  ÚÄÄÄÄÄÄÄÄÄÄÄÄ¿
  ³ 03 Colunas ³
  ÀÄÄÄÄÄÄÄÄÄÄÄÄÙ
 
 
- Visualizar blocos
 
  ÚÄÄÄÂÄÄÄÄÄ¿  ÚÄÄÄÂÄÄÄÄÄ¿
  ³ û ³ Sim ³  ³   ³ N„o ³
  ÀÄÄÄÁÄÄÄÄÄÙ  ÀÄÄÄÁÄÄÄÄÄÙ
 
 
- Comentarios
 
  ÚÄÄÄÂÄÄÄÄÄ¿  ÚÄÄÄÂÄÄÄÄÄ¿
  ³ û ³ Sim ³  ³   ³ N„o ³
  ÀÄÄÄÁÄÄÄÄÄÙ  ÀÄÄÄÁÄÄÄÄÄÙ
 
 
- Rotinas
 
  ÚÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
  ³ û ³ Calendario                    ³
  ÃÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  ³ û ³ Calculadora                   ³
  ÃÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  ³ û ³ Senhas de acesso              ³
  ÃÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  ³ û ³ Help                          ³
  ÃÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  ³ û ³ Back-up                       ³
  ÃÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  ³ û ³ Dos shell                     ³
  ÃÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  ³ û ³ Atualizacao de data           ³
  ÃÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  ³ û ³ Criacao de arquivos           ³
  ÃÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  ³ û ³ Sombras                       ³
  ÃÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  ³ û ³ Mouse                         ³
  ÃÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  ³ û ³ Papel de parede               ³
  ÃÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  ³ û ³ Configuracao de cores         ³
  ÃÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  ³ û ³ Gerador de relatorios         ³
  ÀÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
 
 
- Cores do sistema
 
  ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
  ³     Especificacao     ³ Setcolor ³      Descricao das cores       ³
  ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  ³  Fundo da tela        ³    B+/B  ³  Azul Brilhante / Azul         ³
  ³  Menu                 ³     N/W  ³  Preto / Branco                ³
  ³  Destaque do menu     ³    W+/R  ³  Branco Brilhante / Vermelho   ³
  ³  Janela de dialogo    ³     W/B  ³  Branco / Azul                 ³
  ³  Box janela de dialogo³    N/BG  ³  Preto / Cyan                  ³
  ³  Botoes               ³     N/W  ³  Preto / Branco                ³
  ³  Botao em destaque    ³    W+/W  ³  Branco Brilhante / Branco     ³
  ³  Gets                 ³     N/W  ³  Preto / Branco                ³
  ³  Get em destaque      ³    W+/R  ³  Branco Brilhante / Vermelho   ³
  ³  Tela de apresenta‡„o ³    W+/B  ³  Branco Brilhante / Azul       ³
  ³  Caracteres avulsos   ³     W/B  ³  Branco / Azul                 ³
  ³  Cercaduras           ³     W/B  ³  Branco / Azul                 ³
  ³  T¡tulo               ³   W+/BG  ³  Branco Brilhante / Cyan       ³
  ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
 
 
/* Final NOVOC.DOC */ 
