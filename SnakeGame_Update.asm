    48: 
    49: void SnakeGame::update(const sf::Time& deltaTime)
    50:  {
00403C30 55                   push        ebp  
00403C31 8B EC                mov         ebp,esp  
00403C33 6A FF                push        0FFFFFFFFh  
00403C35 68 0F 57 40 00       push        40570Fh  
00403C3A 64 A1 00 00 00 00    mov         eax,dword ptr fs:[00000000h]  
00403C40 50                   push        eax  
00403C41 83 EC 34             sub         esp,34h  
00403C44 A1 00 90 40 00       mov         eax,dword ptr ds:[00409000h]  
00403C49 33 C5                xor         eax,ebp  
00403C4B 89 45 F0             mov         dword ptr [ebp-10h],eax  
00403C4E 56                   push        esi  
00403C4F 57                   push        edi  
00403C50 50                   push        eax  
00403C51 8D 45 F4             lea         eax,[ebp-0Ch]  
00403C54 64 A3 00 00 00 00    mov         dword ptr fs:[00000000h],eax  
00403C5A 8B F9                mov         edi,ecx  
00403C5C 89 7D D0             mov         dword ptr [ebp-30h],edi  
00403C5F 8B 45 08             mov         eax,dword ptr [ebp+8]  
    51: 	timeAccumulator_ += deltaTime;
00403C62 8D 77 28             lea         esi,[edi+28h]  
00403C65 FF 70 04             push        dword ptr [eax+4]  
00403C68 FF 30                push        dword ptr [eax]  
00403C6A 56                   push        esi  
00403C6B FF 15 BC 61 40 00    call        dword ptr ds:[004061BCh]  
    52: 	const sf::Time timeStep{ sf::seconds(10.f / framesPerSecond_) };
00403C71 F3 0F 10 05 C8 67 40 00 movss       xmm0,dword ptr ds:[004067C8h]  
00403C79 8D 45 E4             lea         eax,[ebp-1Ch]  
00403C7C F3 0F 5E 47 24       divss       xmm0,dword ptr [edi+24h]  
00403C81 83 C4 08             add         esp,8  
00403C84 F3 0F 11 04 24       movss       dword ptr [esp],xmm0  
00403C89 50                   push        eax  
00403C8A FF 15 C4 61 40 00    call        dword ptr ds:[004061C4h]  
    53: 
    54: 	if (timeAccumulator_ >= timeStep)
00403C90 FF 75 E8             push        dword ptr [ebp-18h]  
00403C93 FF 75 E4             push        dword ptr [ebp-1Ch]  
00403C96 FF 76 04             push        dword ptr [esi+4]  
00403C99 FF 36                push        dword ptr [esi]  
00403C9B FF 15 D4 61 40 00    call        dword ptr ds:[004061D4h]  
00403CA1 83 C4 18             add         esp,18h  
00403CA4 84 C0                test        al,al  
00403CA6 0F 84 B9 03 00 00    je          00404065  
    55: 	{
    56: 		timeAccumulator_ -= timeStep;
00403CAC FF 75 E8             push        dword ptr [ebp-18h]  
00403CAF FF 75 E4             push        dword ptr [ebp-1Ch]  
00403CB2 56                   push        esi  
00403CB3 FF 15 C8 61 40 00    call        dword ptr ds:[004061C8h]  
00403CB9 83 C4 0C             add         esp,0Ch  
    57: 
    58: 		if (!directionCommands_.empty())
00403CBC 83 BF 00 14 00 00 00 cmp         dword ptr [edi+00001400h],0  
00403CC3 74 6E                je          00403D33  
    59: 		{
    60: 			snake_.changeDirection(directionCommands_.front());
00403CC5 8B 97 FC 13 00 00    mov         edx,dword ptr [edi+000013FCh]  
00403CCB 8B C2                mov         eax,edx  
00403CCD 8B 8F F8 13 00 00    mov         ecx,dword ptr [edi+000013F8h]  
00403CD3 83 E2 03             and         edx,3  
00403CD6 49                   dec         ecx  
00403CD7 C1 E8 02             shr         eax,2  
00403CDA 23 C8                and         ecx,eax  
00403CDC 8B 87 F4 13 00 00    mov         eax,dword ptr [edi+000013F4h]  
00403CE2 8B 0C 88             mov         ecx,dword ptr [eax+ecx*4]  
00403CE5 8B 0C 91             mov         ecx,dword ptr [ecx+edx*4]  
00403CE8 8B C1                mov         eax,ecx  
00403CEA 83 E8 00             sub         eax,0  
00403CED 74 1C                je          00403D0B  
00403CEF 83 E8 01             sub         eax,1  
00403CF2 74 13                je          00403D07  
00403CF4 83 E8 01             sub         eax,1  
00403CF7 74 07                je          00403D00  
00403CF9 B8 02 00 00 00       mov         eax,2  
00403CFE EB 10                jmp         00403D10  
00403D00 B8 03 00 00 00       mov         eax,3  
00403D05 EB 09                jmp         00403D10  
00403D07 33 C0                xor         eax,eax  
00403D09 EB 05                jmp         00403D10  
00403D0B B8 01 00 00 00       mov         eax,1  
00403D10 39 47 3C             cmp         dword ptr [edi+3Ch],eax  
00403D13 74 03                je          00403D18  
00403D15 89 4F 3C             mov         dword ptr [edi+3Ch],ecx  
    61: 			directionCommands_.pop_front();
00403D18 83 87 00 14 00 00 FF add         dword ptr [edi+00001400h],0FFFFFFFFh  
00403D1F 75 0C                jne         00403D2D  
00403D21 C7 87 FC 13 00 00 00 00 00 00 mov         dword ptr [edi+000013FCh],0  
00403D2B EB 06                jmp         00403D33  
00403D2D FF 87 FC 13 00 00    inc         dword ptr [edi+000013FCh]  
    62: 		} //This is done to prevent multiple events overlapping in the game, causing the logic of the game to be broken
    63: 
    64: 		sf::Vector2f currentSnakeLocation = snake_.getPosition();
00403D33 8B 47 34             mov         eax,dword ptr [edi+34h]  
00403D36 8B 35 50 61 40 00    mov         esi,dword ptr ds:[00406150h]  
00403D3C 8B 08                mov         ecx,dword ptr [eax]  
00403D3E 83 C1 0C             add         ecx,0Ch  
00403D41 FF D6                call        esi  
    65: 
    66: 		if (snakeFood_.getPosition() == currentSnakeLocation)
00403D43 8D 8F 08 14 00 00    lea         ecx,[edi+00001408h]  
    62: 		} //This is done to prevent multiple events overlapping in the game, causing the logic of the game to be broken
    63: 
    64: 		sf::Vector2f currentSnakeLocation = snake_.getPosition();
00403D49 F3 0F 10 00          movss       xmm0,dword ptr [eax]  
00403D4D F3 0F 11 45 DC       movss       dword ptr [ebp-24h],xmm0  
00403D52 F3 0F 10 40 04       movss       xmm0,dword ptr [eax+4]  
00403D57 F3 0F 11 45 D8       movss       dword ptr [ebp-28h],xmm0  
    65: 
    66: 		if (snakeFood_.getPosition() == currentSnakeLocation)
00403D5C FF D6                call        esi  
00403D5E F3 0F 10 4D D8       movss       xmm1,dword ptr [ebp-28h]  
00403D63 8B C8                mov         ecx,eax  
00403D65 F3 0F 10 01          movss       xmm0,dword ptr [ecx]  
00403D69 0F 2E 45 DC          ucomiss     xmm0,dword ptr [ebp-24h]  
00403D6D 9F                   lahf  
00403D6E F6 C4 44             test        ah,44h  
00403D71 0F 8A C0 00 00 00    jp          00403E37  
00403D77 F3 0F 10 41 04       movss       xmm0,dword ptr [ecx+4]  
00403D7C 0F 2E C1             ucomiss     xmm0,xmm1  
00403D7F 9F                   lahf  
00403D80 F6 C4 44             test        ah,44h  
00403D83 0F 8A AE 00 00 00    jp          00403E37  
    67: 		{
    68: 			// snake_.increaseSize();
    69: 			do
    70: 			{
    71: 				snakeFood_.setPosition(gameMap_.generateRandomPosition());
00403D89 8D 4D C0             lea         ecx,[ebp-40h]  
00403D8C 8D 47 4C             lea         eax,[edi+4Ch]  
00403D8F 51                   push        ecx  
00403D90 8B C8                mov         ecx,eax  
00403D92 E8 09 D7 FF FF       call        004014A0  
00403D97 50                   push        eax  
00403D98 8D 8F 08 14 00 00    lea         ecx,[edi+00001408h]  
00403D9E FF 15 A0 61 40 00    call        dword ptr ds:[004061A0h]  
    72: 			} while (snake_.collidesWith(snakeFood_.getPosition()));
00403DA4 8D 8F 08 14 00 00    lea         ecx,[edi+00001408h]  
00403DAA FF D6                call        esi  
00403DAC 89 45 EC             mov         dword ptr [ebp-14h],eax  
00403DAF 8B 47 34             mov         eax,dword ptr [edi+34h]  
00403DB2 89 45 E0             mov         dword ptr [ebp-20h],eax  
00403DB5 8B 30                mov         esi,dword ptr [eax]  
00403DB7 3B F0                cmp         esi,eax  
00403DB9 74 38                je          00403DF3  
00403DBB 0F 1F 44 00 00       nop         dword ptr [eax+eax]  
00403DC0 8D 4E 0C             lea         ecx,[esi+0Ch]  
00403DC3 FF 15 50 61 40 00    call        dword ptr ds:[00406150h]  
00403DC9 8B 55 EC             mov         edx,dword ptr [ebp-14h]  
00403DCC 8B C8                mov         ecx,eax  
00403DCE F3 0F 10 01          movss       xmm0,dword ptr [ecx]  
00403DD2 0F 2E 02             ucomiss     xmm0,dword ptr [edx]  
00403DD5 9F                   lahf  
00403DD6 F6 C4 44             test        ah,44h  
00403DD9 7A 0F                jp          00403DEA  
00403DDB F3 0F 10 41 04       movss       xmm0,dword ptr [ecx+4]  
00403DE0 0F 2E 42 04          ucomiss     xmm0,dword ptr [edx+4]  
00403DE4 9F                   lahf  
00403DE5 F6 C4 44             test        ah,44h  
00403DE8 7B 35                jnp         00403E1F  
00403DEA 8B 06                mov         eax,dword ptr [esi]  
00403DEC 8B F0                mov         esi,eax  
00403DEE 3B 45 E0             cmp         eax,dword ptr [ebp-20h]  
00403DF1 75 CD                jne         00403DC0  
    73: 
    74: 			if ((snake_.length() % 10) == 0) //Increase the speed of the snake every time 10 pieces of food are eaten
00403DF3 8B 47 38             mov         eax,dword ptr [edi+38h]  
00403DF6 33 D2                xor         edx,edx  
00403DF8 B9 0A 00 00 00       mov         ecx,0Ah  
00403DFD F7 F1                div         eax,ecx  
00403DFF 85 D2                test        edx,edx  
00403E01 75 2F                jne         00403E32  
    75: 											 //by increasing the frames per second
    76: 			{
    77: 				framesPerSecond_ = (framesPerSecond_ < 20.f) ? (framesPerSecond_ + 1.f) : 20.f;
00403E03 F3 0F 10 47 24       movss       xmm0,dword ptr [edi+24h]  
00403E08 F3 0F 10 0D D0 67 40 00 movss       xmm1,dword ptr ds:[004067D0h]  
00403E10 0F 2F C8             comiss      xmm1,xmm0  
00403E13 76 15                jbe         00403E2A  
00403E15 F3 0F 58 05 BC 67 40 00 addss       xmm0,dword ptr ds:[004067BCh]  
00403E1D EB 0E                jmp         00403E2D  
    72: 			} while (snake_.collidesWith(snakeFood_.getPosition()));
00403E1F 8B 35 50 61 40 00    mov         esi,dword ptr ds:[00406150h]  
00403E25 E9 5F FF FF FF       jmp         00403D89  
    75: 											 //by increasing the frames per second
    76: 			{
    77: 				framesPerSecond_ = (framesPerSecond_ < 20.f) ? (framesPerSecond_ + 1.f) : 20.f;
00403E2A 0F 28 C1             movaps      xmm0,xmm1  
00403E2D F3 0F 11 47 24       movss       dword ptr [edi+24h],xmm0  
    78: 			}
    79: 		}
    80: 
    81: 		if (
    82: 			(currentSnakeLocation.x >= gameMap_.getSize().x) ||
    83: 			(currentSnakeLocation.x < 0.f) ||
    84: 			(currentSnakeLocation.y >= gameMap_.getSize().y) ||
    85: 			(currentSnakeLocation.y < 0.f) ||
00403E32 F3 0F 10 4D D8       movss       xmm1,dword ptr [ebp-28h]  
00403E37 F3 0F 10 45 DC       movss       xmm0,dword ptr [ebp-24h]  
00403E3C 0F 2F 47 5C          comiss      xmm0,dword ptr [edi+5Ch]  
00403E40 0F 83 A6 01 00 00    jae         00403FEC  
00403E46 0F 57 C0             xorps       xmm0,xmm0  
00403E49 0F 2F 45 DC          comiss      xmm0,dword ptr [ebp-24h]  
00403E4D 0F 87 99 01 00 00    ja          00403FEC  
00403E53 0F 2F 4F 60          comiss      xmm1,dword ptr [edi+60h]  
00403E57 0F 83 8F 01 00 00    jae         00403FEC  
00403E5D 0F 2F C1             comiss      xmm0,xmm1  
00403E60 0F 87 86 01 00 00    ja          00403FEC  
00403E66 8B 4F 34             mov         ecx,dword ptr [edi+34h]  
00403E69 8D 57 34             lea         edx,[edi+34h]  
00403E6C 89 55 EC             mov         dword ptr [ebp-14h],edx  
00403E6F 8B 01                mov         eax,dword ptr [ecx]  
00403E71 8B 30                mov         esi,dword ptr [eax]  
00403E73 3B F1                cmp         esi,ecx  
00403E75 74 39                je          00403EB0  
00403E77 8D 4E 0C             lea         ecx,[esi+0Ch]  
00403E7A FF 15 50 61 40 00    call        dword ptr ds:[00406150h]  
00403E80 8B C8                mov         ecx,eax  
00403E82 F3 0F 10 01          movss       xmm0,dword ptr [ecx]  
00403E86 0F 2E 45 DC          ucomiss     xmm0,dword ptr [ebp-24h]  
00403E8A 9F                   lahf  
00403E8B F6 C4 44             test        ah,44h  
00403E8E 7A 13                jp          00403EA3  
00403E90 F3 0F 10 41 04       movss       xmm0,dword ptr [ecx+4]  
00403E95 0F 2E 45 D8          ucomiss     xmm0,dword ptr [ebp-28h]  
00403E99 9F                   lahf  
00403E9A F6 C4 44             test        ah,44h  
00403E9D 0F 8B 49 01 00 00    jnp         00403FEC  
00403EA3 8B 06                mov         eax,dword ptr [esi]  
00403EA5 8D 57 34             lea         edx,[edi+34h]  
00403EA8 8B 0A                mov         ecx,dword ptr [edx]  
00403EAA 8B F0                mov         esi,eax  
00403EAC 3B C1                cmp         eax,ecx  
00403EAE 75 C7                jne         00403E77  
    91: 		}
    92: 		else
    93: 		{
    94: 			snake_.moveForward();
00403EB0 8B 41 04             mov         eax,dword ptr [ecx+4]  
00403EB3 83 C0 08             add         eax,8  
00403EB6 81 7A 04 38 70 E0 00 cmp         dword ptr [edx+4],0E07038h  
00403EBD 89 45 E0             mov         dword ptr [ebp-20h],eax  
00403EC0 8B 01                mov         eax,dword ptr [ecx]  
00403EC2 89 45 DC             mov         dword ptr [ebp-24h],eax  
00403EC5 75 0B                jne         00403ED2  
00403EC7 68 D4 66 40 00       push        4066D4h  
00403ECC FF 15 3C 60 40 00    call        dword ptr ds:[0040603Ch]  
00403ED2 89 55 D4             mov         dword ptr [ebp-2Ch],edx  
00403ED5 C7 45 FC 01 00 00 00 mov         dword ptr [ebp-4],1  
00403EDC 68 24 01 00 00       push        124h  
00403EE1 C7 45 D8 00 00 00 00 mov         dword ptr [ebp-28h],0  
00403EE8 E8 23 07 00 00       call        00404610  
00403EED 83 C4 04             add         esp,4  
00403EF0 8B F8                mov         edi,eax  
00403EF2 89 7D D8             mov         dword ptr [ebp-28h],edi  
00403EF5 FF 75 E0             push        dword ptr [ebp-20h]  
00403EF8 8D 4F 08             lea         ecx,[edi+8]  
00403EFB FF 15 60 61 40 00    call        dword ptr ds:[00406160h]  
00403F01 8B 4D DC             mov         ecx,dword ptr [ebp-24h]  
00403F04 C7 45 FC FF FF FF FF mov         dword ptr [ebp-4],0FFFFFFFFh  
00403F0B 8B 55 EC             mov         edx,dword ptr [ebp-14h]  
00403F0E C7 47 08 C4 62 40 00 mov         dword ptr [edi+8],4062C4h  
00403F15 C7 47 0C EC 62 40 00 mov         dword ptr [edi+0Ch],4062ECh  
00403F1C 6A 00                push        0  
00403F1E FF 42 04             inc         dword ptr [edx+4]  
00403F21 8B 41 04             mov         eax,dword ptr [ecx+4]  
00403F24 89 0F                mov         dword ptr [edi],ecx  
00403F26 89 47 04             mov         dword ptr [edi+4],eax  
00403F29 89 79 04             mov         dword ptr [ecx+4],edi  
00403F2C 89 38                mov         dword ptr [eax],edi  
00403F2E 8B 02                mov         eax,dword ptr [edx]  
00403F30 8B 70 04             mov         esi,dword ptr [eax+4]  
00403F33 8B 0E                mov         ecx,dword ptr [esi]  
00403F35 FF 4A 04             dec         dword ptr [edx+4]  
00403F38 8B 46 04             mov         eax,dword ptr [esi+4]  
00403F3B 89 08                mov         dword ptr [eax],ecx  
00403F3D 8B 46 04             mov         eax,dword ptr [esi+4]  
00403F40 89 41 04             mov         dword ptr [ecx+4],eax  
00403F43 8D 4E 08             lea         ecx,[esi+8]  
00403F46 8B 01                mov         eax,dword ptr [ecx]  
00403F48 FF 10                call        dword ptr [eax]  
00403F4A 68 24 01 00 00       push        124h  
00403F4F 56                   push        esi  
00403F50 E8 EB 06 00 00       call        00404640  
00403F55 8B 45 D0             mov         eax,dword ptr [ebp-30h]  
00403F58 83 C4 08             add         esp,8  
00403F5B 0F 57 C9             xorps       xmm1,xmm1  
00403F5E 0F 57 D2             xorps       xmm2,xmm2  
00403F61 8B 48 3C             mov         ecx,dword ptr [eax+3Ch]  
00403F64 83 F9 03             cmp         ecx,3  
00403F67 77 2D                ja          00403F96  
00403F69 FF 24 8D 84 40 40 00 jmp         dword ptr [ecx*4+00404084h]  
00403F70 F3 0F 10 15 D8 67 40 00 movss       xmm2,dword ptr ds:[004067D8h]  
00403F78 EB 1C                jmp         00403F96  
00403F7A F3 0F 10 15 BC 67 40 00 movss       xmm2,dword ptr ds:[004067BCh]  
00403F82 EB 12                jmp         00403F96  
00403F84 F3 0F 10 0D D8 67 40 00 movss       xmm1,dword ptr ds:[004067D8h]  
00403F8C EB 08                jmp         00403F96  
00403F8E F3 0F 10 0D BC 67 40 00 movss       xmm1,dword ptr ds:[004067BCh]  
00403F96 F3 0F 59 48 44       mulss       xmm1,dword ptr [eax+44h]  
00403F9B 8D 70 34             lea         esi,[eax+34h]  
00403F9E F3 0F 59 50 44       mulss       xmm2,dword ptr [eax+44h]  
00403FA3 8B 06                mov         eax,dword ptr [esi]  
00403FA5 F3 0F 11 4D EC       movss       dword ptr [ebp-14h],xmm1  
00403FAA F3 0F 11 55 E0       movss       dword ptr [ebp-20h],xmm2  
00403FAF 8B 00                mov         eax,dword ptr [eax]  
00403FB1 8B 08                mov         ecx,dword ptr [eax]  
00403FB3 8D 49 0C             lea         ecx,[ecx+0Ch]  
00403FB6 FF 15 50 61 40 00    call        dword ptr ds:[00406150h]  
00403FBC F3 0F 10 4D E0       movss       xmm1,dword ptr [ebp-20h]  
00403FC1 F3 0F 10 45 EC       movss       xmm0,dword ptr [ebp-14h]  
00403FC6 F3 0F 58 48 04       addss       xmm1,dword ptr [eax+4]  
00403FCB F3 0F 58 00          addss       xmm0,dword ptr [eax]  
00403FCF 8D 45 C8             lea         eax,[ebp-38h]  
00403FD2 50                   push        eax  
00403FD3 8B 06                mov         eax,dword ptr [esi]  
00403FD5 F3 0F 11 4D CC       movss       dword ptr [ebp-34h],xmm1  
00403FDA F3 0F 11 45 C8       movss       dword ptr [ebp-38h],xmm0  
00403FDF 8B 08                mov         ecx,dword ptr [eax]  
00403FE1 83 C1 0C             add         ecx,0Ch  
00403FE4 FF 15 A0 61 40 00    call        dword ptr ds:[004061A0h]  
00403FEA EB 79                jmp         00404065  
    86: 			(snake_.collidesWith(currentSnakeLocation, false)) //If the snake is out of bounds or has a self collision
    87: 			)
    88: 		{
    89: 			snake_.setColor(snakeDeadColor_);
00403FEC 8B 47 18             mov         eax,dword ptr [edi+18h]  
00403FEF 89 45 EC             mov         dword ptr [ebp-14h],eax  
00403FF2 89 47 48             mov         dword ptr [edi+48h],eax  
00403FF5 8B 47 34             mov         eax,dword ptr [edi+34h]  
00403FF8 8B 30                mov         esi,dword ptr [eax]  
00403FFA 3B F0                cmp         esi,eax  
00403FFC 74 1A                je          00404018  
00403FFE 8B F8                mov         edi,eax  
00404000 8D 45 EC             lea         eax,[ebp-14h]  
00404003 8D 4E 08             lea         ecx,[esi+8]  
00404006 50                   push        eax  
00404007 FF 15 78 61 40 00    call        dword ptr ds:[00406178h]  
0040400D 8B 06                mov         eax,dword ptr [esi]  
0040400F 8B F0                mov         esi,eax  
00404011 3B C7                cmp         eax,edi  
00404013 75 EB                jne         00404000  
00404015 8B 7D D0             mov         edi,dword ptr [ebp-30h]  
    90: 			setNextState(new GameOver{ getWindowSize(), static_cast<int>(snake_.length()) });
00404018 68 E0 03 00 00       push        3E0h  
0040401D E8 EE 05 00 00       call        00404610  
00404022 8B F0                mov         esi,eax  
00404024 89 75 E0             mov         dword ptr [ebp-20h],esi  
00404027 68 E0 03 00 00       push        3E0h  
0040402C 6A 00                push        0  
0040402E 56                   push        esi  
0040402F C7 45 FC 00 00 00 00 mov         dword ptr [ebp-4],0  
00404036 E8 1D 12 00 00       call        00405258  
0040403B 83 C4 10             add         esp,10h  
0040403E 8B CE                mov         ecx,esi  
00404040 FF 77 38             push        dword ptr [edi+38h]  
00404043 FF 77 0C             push        dword ptr [edi+0Ch]  
00404046 FF 77 08             push        dword ptr [edi+8]  
00404049 E8 12 DD FF FF       call        00401D60  
0040404E 8B 4F 04             mov         ecx,dword ptr [edi+4]  
00404051 8B F0                mov         esi,eax  
00404053 3B CF                cmp         ecx,edi  
00404055 74 0B                je          00404062  
00404057 85 C9                test        ecx,ecx  
00404059 74 07                je          00404062  
0040405B 8B 01                mov         eax,dword ptr [ecx]  
0040405D 6A 01                push        1  
0040405F FF 50 10             call        dword ptr [eax+10h]  
00404062 89 77 04             mov         dword ptr [edi+4],esi  
    95: 		}
    96: 	}
    97: }
00404065 8B 4D F4             mov         ecx,dword ptr [ebp-0Ch]  
00404068 64 89 0D 00 00 00 00 mov         dword ptr fs:[00000000h],ecx  
0040406F 59                   pop         ecx  
00404070 5F                   pop         edi  
00404071 5E                   pop         esi  
00404072 8B 4D F0             mov         ecx,dword ptr [ebp-10h]  
00404075 33 CD                xor         ecx,ebp  
00404077 E8 86 05 00 00       call        00404602  
0040407C 8B E5                mov         esp,ebp  
0040407E 5D                   pop         ebp  
0040407F C2 04 00             ret         4  
00404082 66 90                nop  
00404084 70 3F                jo          004040C5  
00404086 40                   inc         eax  
00404087 00 7A 3F             add         byte ptr [edx+3Fh],bh  
0040408A 40                   inc         eax  
0040408B 00 84 3F 40 00 8E 3F add         byte ptr [edi+edi+3F8E0040h],al  
00404092 40                   inc         eax  
00404093 00 CC                add         ah,cl  