#Include 'Protheus.ch'

User Function tdnXtree()

rpcsetenv('99','01')

oModel := FWLoadModel("CNTA300") //Carrega o modelo



return


User Function tstXtree()

	Local oGet
	Local cGet := Space(6)
	Local cDescri := Space(10)
	DEFINE DIALOG oDlg TITLE "Exemplo de XTree" FROM 0,0 TO 600,800 PIXEL

	//-------------------
	//Cria o objeto XTREE
	//-------------------
	oTree := xTree():New(000,000,300,300,oDlg,/*uChange*/,/*uRClick*/,/*bDblClick*/)

	//-------
	//Nível 1
	//-------
	oTree:AddTree("01","folder5.png","folder6.png","01",/*bAction*/,/*bRClick*/,/*bDblClick*/)
	//-------
	//Nível 2
	//-------
	oTree:AddTree("Teste","folder5.png","folder6.png","0101",/*bAction*/,/*bRClick*/,/*bDblClick*/)

	oTree:EndTree()

	oTree:AddTree("0101","folder5.png","folder6.png","0101",/*bAction*/,/*bRClick*/,/*bDblClick*/)

	//-------
	//Nível 3
	//-------

	oTree:AddTreeItem("0102","folder5.png","0102",/*bAction*/,/*bRClick*/,/*bDblClick*/)

	oTree:EndTree()

	oTree:AddTree("0103","folder5.png","folder6.png","0103",{|a,b,c,d,e,f,g,h,i|FuncAction(a,b,c,d,e,f,g,h,i)}/*bAction*/,/*bRClick*/,/*bDblClick*/)

	oTree:EndTree()

	oTree:EndTree()

	oTree:AddTree("09","folder5.png","folder6.png","09",/*bAction*/,/*bRClick*/,/*bDblClick*/)

	oMenu := TMenu():New(0,0,0,0,.T.)
	oTMenuIte1 := TMenuItem():New(oDlg,"TMenuItem 01",,,,{|| conout("TMenuItem 01") },,,,,,,,,.T.)
	oTMenuIte2 := TMenuItem():New(oDlg,"TMenuItem 02",,,,{|| conout("TMenuItem 02") },,,,,,,,,.T.)
	oTMenuIte3 := TMenuItem():New(oDlg,"TMenuItem 03",,,,{|| conout("TMenuItem 03") },,,,,,,,,.T.)
	oMenu:Add(oTMenuIte1)
	oMenu:Add(oTMenuIte2)
	oMenu:Add(oTMenuIte3)

	oTree:SetPopup( oMenu )

	//---------------
	//Funcionalidades
	//---------------
	@ 000,340 GET oGet VAR cGet OF oDlg SIZE 40, 010 PIXEL
	TButton():New( 0,300 , "Seek Item", oDlg,{|| oTree:TreeSeek(AllTrim(cGet))},40,010,,,.F.,.T.,.F.,,.F.,,,.F. )


	TButton():New( 010,300 , "Add Item", oDlg,{|| AddItem(oTree) },40,010,,,.F.,.T.,.F.,,.F.,,,.F. )

	TButton():New( 020,300 , "Change BMP", oDlg,{|| oTree:ChangeBmp("LBNO","LBTIK","01") },40,010,,,.F.,.T.,.F.,,.F.,,,.F. )

	@ 030,340 GET oGet1 VAR cDescri OF oDlg SIZE 40, 010 PIXEL
	TButton():New( 030,300 , "Altera Prompt", oDlg,{|| ChangePrompt(oTree,cDescri)},40,010,,,.F.,.T.,.F.,,.F.,,,.F. )

	TButton():New( 040,300 , "Info Pai", oDlg,{|| ShowFatherInfo(oTree)},40,010,,,.F.,.T.,.F.,,.F.,,,.F. )


	ACTIVATE DIALOG oDlg CENTERED
Return
Static Function ChangePrompt(oTree,cDescri)
	oTree:ChangePrompt(cDescri,oTree:GetCargo())
Return

Static Function AddItem(oTree)
	If oTree:TreeSeek("0102")

		oTree:AddItem("Novo Item","0106","folder5.png","folder6.png",2,/*bAction*/,/*bRClick*/,/*bDblClick*/)

	EndIf
Return

Static Function ShowFatherInfo(oTree)
	Local aInfo := oTree:GetFatherNode()
	Local cMessage
	If Len(aInfo) > 0
		cMessage := "ID do Pai : " + aInfo[1] + CRLF
		cMessage += "ID : " + aInfo[2] + CRLF
		cMessage += "É nó? : " + IIf(aInfo[3],".T.",".F.") + CRLF
		cMessage += "cCargo : " + aInfo[4] + CRLF
		cMessage += "cResource1: " + aInfo[5] + CRLF
		cMessage += "cResource2: " + aInfo[6] + CRLF
		MsgInfo(cMessage,"Info do nó pai")
	EndIf
Return

static function FuncAction(a,b,c,d,e,f,g,h,i)

	conout(time())

return

