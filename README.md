  MIRO 3.0 - DOCUMENTA€ŽO DO SISTEMA
   
  SISTEMA : NOVOC
  TITULO  : Controle de Caixa - Versao 3.20030922                                           
 
 
  ARQUIVOS
   
  AREA      : 1
  ARQUIVO   : CADCLI.DBF
 
  CAMPO       TIPO      TAMANHO  DECIMAIS  DESCRICAO
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
  
 
 
  AREA      : 2
  ARQUIVO   : MOVIMENT.DBF
 
  CAMPO       TIPO      TAMANHO  DECIMAIS  DESCRICAO
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
   
 
 
  AREA      : 3
  ARQUIVO   : SERVICOS.DBF
 
  CAMPO       TIPO      TAMANHO  DECIMAIS  DESCRICAO
  CODIGO      CARACTER        3         0                                     
  DESCRICAO   CARACTER       25         0                                     
 
  INDICE    : SERVI010.NTX
  EXPRESSAO : CODIGO
  ORDEM     : 1
 
  INDICE    : SERVI011.NTX
  EXPRESSAO : DESCRICAO
  ORDEM     : 2

 
 
 
 
  SISTEMA NOVOC - MODULOS (PRG)
  

  Modulo         Descricao           
  NOVOC.PRG      Modulo principal              
  NOVOCfu1.PRG   Modulo de funcoes - Parte I   
  NOVOCfu2.PRG   Modulo de funcoes - Parte II  
  NOVOCfu3.PRG   Modulo de funcoes - Parte III 
  NOVOCarq.PRG   Rotina de criacao de arquivos 
  NOVOCsos.PRG   Rotinas de help               
  NOVOCinc.PRG   Menu de cadastros             
  NOVOCi01.PRG   Clientes                      
  NOVOCi02.PRG   Servicos                      
  NOVOCi03.PRG   Movimentos                    
  NOVOCcon.PRG   Menu de manuten‡”es           
  NOVOCc01.PRG   Clientes                      
  NOVOCc02.PRG   Servicos                      
  NOVOCc03.PRG   Movimentos                    
  NOVOCrel.PRG   Menu de relatorios            
      -=-        Clientes                      
  NOVOCr02.PRG   Alfabetica                    
  NOVOCr03.PRG   Numerica                      
      -=-        Servicos                      
  NOVOCr05.PRG   Alfabetica                    
  NOVOCr06.PRG   Numerica                      
      -=-        Movimentos                    
  NOVOCr98.PRG   Em.de Rec.- Data              
  NOVOCr08.PRG   Em.de Rec.- Geral             
  NOVOCr09.PRG   Em.de Rec.- Avulso            
  NOVOCr99.PRG   Em.de Rec.- Cliente           
  NOVOCr10.PRG   Rec.Baixados                  
  NOVOCr11.PRG   Rec.Em Aberto                 
      -=-        Especiais                     
  NOVOCr13.PRG   Fluxo de Caixa                
 
 
 
 
  CONFIGURACAO DO SISTEMA

 
- Linguagem
  Clipper 5.01 
 
 
 
- Tratamento de arquivos
  Monousuario

 
 
- Endentacao 
  03 Colunas 
 
 
 
- Visualizar blocos
 

  ³ û ³ Sim ³  ³   ³ N„o ³
 
 
 
- Comentarios
 
 
  ³ û ³ Sim ³  ³   ³ N„o ³

 
 
- Rotinas
 

  ³ û ³ Calendario                    ³

  ³ û ³ Calculadora                   ³

  ³ û ³ Senhas de acesso              ³
 
  ³ û ³ Help                          ³

  ³ û ³ Back-up                       ³

  ³ û ³ Dos shell                     ³

  ³ û ³ Atualizacao de data           ³

  ³ û ³ Criacao de arquivos           ³

  ³ û ³ Sombras                       ³
 
  ³ û ³ Mouse                         ³
 
  ³ û ³ Papel de parede               ³
 
  ³ û ³ Configuracao de cores         ³

  ³ û ³ Gerador de relatorios         ³

 
 
- Cores do sistema
 

  ³     Especificacao     ³ Setcolor ³      Descricao das cores       ³
 
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

 
 
/* Final NOVOC.DOC */ 
