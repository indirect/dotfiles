FasdUAS 1.101.10   ��   ��    k             l      ��  ��   ��
? Veritrope.com
Export All Safari Tabs to a Text File
VERSION 1.1
March 5, 2013

// UPDATE NOTICES
     ** Follow @Veritrope on Twitter, Facebook, Google Plus, and ADN for Update Notices! **

// SUPPORT VERITROPE!
     If this AppleScript was useful to you, please take a second to show your love here: 
     http://veritrope.com/support

// SCRIPT INFORMATION AND UPDATE PAGE
     http://veritrope.com/code/export-all-safari-tabs-to-a-text-file

// REQUIREMENTS
     More details on the script information page.

// CHANGELOG
    1.1  REVISED FILE NAMING METHOD
    1.0  INITIAL RELEASE

// TERMS OF USE:
     This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License. 

     To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/3.0/ or send a letter to Creative Commons, 444 Castro Street, Suite 900, Mountain View, California, 94041, USA.


     � 	 	8 
%�   V e r i t r o p e . c o m 
 E x p o r t   A l l   S a f a r i   T a b s   t o   a   T e x t   F i l e 
 V E R S I O N   1 . 1 
 M a r c h   5 ,   2 0 1 3 
 
 / /   U P D A T E   N O T I C E S 
           * *   F o l l o w   @ V e r i t r o p e   o n   T w i t t e r ,   F a c e b o o k ,   G o o g l e   P l u s ,   a n d   A D N   f o r   U p d a t e   N o t i c e s !   * * 
 
 / /   S U P P O R T   V E R I T R O P E ! 
           I f   t h i s   A p p l e S c r i p t   w a s   u s e f u l   t o   y o u ,   p l e a s e   t a k e   a   s e c o n d   t o   s h o w   y o u r   l o v e   h e r e :   
           h t t p : / / v e r i t r o p e . c o m / s u p p o r t 
 
 / /   S C R I P T   I N F O R M A T I O N   A N D   U P D A T E   P A G E 
           h t t p : / / v e r i t r o p e . c o m / c o d e / e x p o r t - a l l - s a f a r i - t a b s - t o - a - t e x t - f i l e 
 
 / /   R E Q U I R E M E N T S 
           M o r e   d e t a i l s   o n   t h e   s c r i p t   i n f o r m a t i o n   p a g e . 
 
 / /   C H A N G E L O G 
         1 . 1     R E V I S E D   F I L E   N A M I N G   M E T H O D 
         1 . 0     I N I T I A L   R E L E A S E 
 
 / /   T E R M S   O F   U S E : 
           T h i s   w o r k   i s   l i c e n s e d   u n d e r   t h e   C r e a t i v e   C o m m o n s   A t t r i b u t i o n - N o n C o m m e r c i a l - S h a r e A l i k e   3 . 0   U n p o r t e d   L i c e n s e .   
 
           T o   v i e w   a   c o p y   o f   t h i s   l i c e n s e ,   v i s i t   h t t p : / / c r e a t i v e c o m m o n s . o r g / l i c e n s e s / b y - n c - s a / 3 . 0 /   o r   s e n d   a   l e t t e r   t o   C r e a t i v e   C o m m o n s ,   4 4 4   C a s t r o   S t r e e t ,   S u i t e   9 0 0 ,   M o u n t a i n   V i e w ,   C a l i f o r n i a ,   9 4 0 4 1 ,   U S A . 
 
 
   
  
 l     ��������  ��  ��        l      ��  ��     y 
======================================
// USER SWITCHES (YOU CAN CHANGE THESE!)
======================================
     �   �   
 = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
 / /   U S E R   S W I T C H E S   ( Y O U   C A N   C H A N G E   T H E S E ! ) 
 = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
      l     ��������  ��  ��        l     ��  ��      NAME OF REPORT TITLE     �   *   N A M E   O F   R E P O R T   T I T L E      j     �� �� 0 report_title report_Title  m        �   2 U R L   L i s t   f r o m   S a f a r i   T a b s      l     ��������  ��  ��         l      �� ! "��   ! g a 
======================================
// MAIN PROGRAM 
======================================
    " � # # �   
 = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
 / /   M A I N   P R O G R A M   
 = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
    $ % $ l     ��������  ��  ��   %  & ' & l     �� ( )��   (   PREPARE THE LIST    ) � * * "   P R E P A R E   T H E   L I S T '  + , + l     -���� - r      . / . J     ����   / o      ���� 0 url_list  ��  ��   ,  0 1 0 l    2���� 2 r     3 4 3 l    5���� 5 c     6 7 6 l   
 8���� 8 l   
 9���� 9 I   
������
�� .misccurdldt    ��� null��  ��  ��  ��  ��  ��   7 m   
 ��
�� 
TEXT��  ��   4 l      :���� : o      ���� 0 
date_stamp  ��  ��  ��  ��   1  ; < ; l    =���� = r     > ? > b     @ A @ b     B C B o    ���� 0 report_title report_Title C m     D D � E E    |   A l    F���� F o    ���� 0 
date_stamp  ��  ��   ? o      ���� 0 	notetitle 	NoteTitle��  ��   <  G H G l     ��������  ��  ��   H  I J I l     �� K L��   K   GET TABS FROM SAFARI    L � M M *   G E T   T A B S   F R O M   S A F A R I J  N O N l   � P���� P O    � Q R Q k    � S S  T U T I   $������
�� .miscactvnull��� ��� null��  ��   U  V W V r   % + X Y X 4   % )�� Z
�� 
cwin Z m   ' (����  Y o      ���� 0 safariwindow safariWindow W  [�� [ X   , � \�� ] \ Q   < � ^ _�� ^ X   ? � `�� a ` k   Q � b b  c d c r   Q V e f e l  Q T g���� g n   Q T h i h 1   R T��
�� 
pnam i o   Q R���� 0 t  ��  ��   f o      ���� 0 tabtitle TabTitle d  j k j r   W ` l m l l  W \ n���� n n   W \ o p o 1   X \��
�� 
pURL p o   W X���� 0 t  ��  ��   m o      ���� 0 taburl TabURL k  q r q r   a z s t s l  a v u���� u b   a v v w v b   a r x y x b   a n z { z b   a j | } | b   a f ~  ~ m   a d � � � � �    o   d e���� 0 tabtitle TabTitle } o   f i��
�� 
ret  { o   j m���� 0 taburl TabURL y o   n q��
�� 
ret  w o   r u��
�� 
ret ��  ��   t o      ���� 0 tabinfo TabInfo r  ��� � s   { � � � � o   { ~���� 0 tabinfo TabInfo � l      ����� � n       � � �  ;    � � o   ~ ���� 0 url_list  ��  ��  ��  �� 0 t   a l  B E ����� � n   B E � � � 2  C E��
�� 
bTab � o   B C���� 0 w  ��  ��   _ R      ������
�� .ascrerr ****      � ****��  ��  ��  �� 0 w   ] o   / 0���� 0 safariwindow safariWindow��   R m     � ��                                                                                  sfri  alis    "  Macintosh HD                   BD ����
Safari.app                                                     ����            ����  
 cu             Applications  /:Applications:Safari.app/   
 S a f a r i . a p p    M a c i n t o s h   H D  Applications/Safari.app   / ��  ��  ��   O  � � � l     ��������  ��  ��   �  � � � l     �� � ���   �   CONVERT URL_LIST TO TEXT    � � � � 2   C O N V E R T   U R L _ L I S T   T O   T E X T �  � � � l  � � ����� � r   � � � � � n  � � � � � 1   � ���
�� 
txdl � 1   � ���
�� 
ascr � o      ���� 0 	old_delim  ��  ��   �  � � � l  � � ����� � r   � � � � � o   � ���
�� 
ret  � n      � � � 1   � ���
�� 
txdl � 1   � ���
�� 
ascr��  ��   �  � � � l  � � ����� � r   � � � � � c   � � � � � l  � � ����� � b   � � � � � b   � � � � � b   � � � � � b   � � � � � o   � ����� 0 	notetitle 	NoteTitle � o   � ���
�� 
ret  � o   � ���
�� 
ret  � o   � ���
�� 
ret  � o   � ����� 0 url_list  ��  ��   � m   � ���
�� 
ctxt � o      ���� 0 url_list  ��  ��   �  � � � l  � � ����� � r   � � � � � o   � ����� 0 	old_delim   � n      � � � 1   � ���
�� 
txdl � 1   � ���
�� 
ascr��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � #  CHOOSE FILE NAME FOR EXPORT     � � � � :   C H O O S E   F I L E   N A M E   F O R   E X P O R T   �  � � � l     �� � ���   � N H (WRAPPING IN A FINDER FUNCTION SO THE DIALOG WORKS IN ALFRED, KM, ETC.)    � � � � �   ( W R A P P I N G   I N   A   F I N D E R   F U N C T I O N   S O   T H E   D I A L O G   W O R K S   I N   A L F R E D ,   K M ,   E T C . ) �  � � � l  �  ���� � O   �  � � � k   � � � �  � � � I  � ��~�}�|
�~ .miscactvnull��� ��� null�}  �|   �  ��{ � r   � � � � � I  � ��z�y �
�z .sysonwflfile    ��� null�y   � �x � �
�x 
prmt � m   � � � � � � �  N a m e   t h i s   f i l e : � �w � �
�w 
dfnm � o   � ��v�v 0 report_title report_Title � �u ��t
�u 
dflc � l  � � ��s�r � I  � ��q ��p
�q .earsffdralis        afdr � m   � ��o
�o afdmdesk�p  �s  �r  �t   � o      �n�n 0 	save_file 	save_File�{   � m   � � � ��                                                                                  MACS  alis    @  Macintosh HD                   BD ����
Finder.app                                                     ����            ����  
 cu             CoreServices  )/:System:Library:CoreServices:Finder.app/    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  ��  �   �  � � � l     �m�l�k�m  �l  �k   �  � � � l     �j � ��j   �  WRITE THE FILE    � � � �  W R I T E   T H E   F I L E �  ��i � l = ��h�g � O  = � � � k  < � �  � � � r   � � � I �f � �
�f .rdwropenshor       file � l  ��e�d � c   � � � b   � � � o  
�c�c 0 	save_file 	save_File � m  
 � � � � �  . t x t � m  �b
�b 
TEXT�e  �d   � �a ��`
�a 
perm � m  �_
�_ boovtrue�`   � o      �^�^ 0 	save_file 	save_File �  � � � Q  4 � ��] � I  +�\ � �
�\ .rdwrwritnull���     **** � o   !�[�[ 0 url_list   � �Z ��Y
�Z 
refn � o  $'�X�X 0 	save_file 	save_File�Y   � R      �W�V�U
�W .ascrerr ****      � ****�V  �U  �]   �  ��T � I 5<�S ��R
�S .rdwrclosnull���     **** � o  58�Q�Q 0 	save_file 	save_File�R  �T   � m   � ��                                                                                  sevs  alis    \  Macintosh HD                   BD ����System Events.app                                              ����            ����  
 cu             CoreServices  0/:System:Library:CoreServices:System Events.app/  $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  �h  �g  �i       �P �  ��P   � �O�N�O 0 report_title report_Title
�N .aevtoappnull  �   � **** � �M �L�K�J
�M .aevtoappnull  �   � ****  k    =  +  0  ;  N  �  �		  �

  �  �  ��I�I  �L  �K   �H�G�H 0 w  �G 0 t   ,�F�E�D�C D�B ��A�@�?�>�=�<�;�:�9�8�7 ��6�5�4�3�2�1�0�/ ��. ��-�,�+�*�)�(�' � ��&�%�$�#�"�F 0 url_list  
�E .misccurdldt    ��� null
�D 
TEXT�C 0 
date_stamp  �B 0 	notetitle 	NoteTitle
�A .miscactvnull��� ��� null
�@ 
cwin�? 0 safariwindow safariWindow
�> 
kocl
�= 
cobj
�< .corecnte****       ****
�; 
bTab
�: 
pnam�9 0 tabtitle TabTitle
�8 
pURL�7 0 taburl TabURL
�6 
ret �5 0 tabinfo TabInfo�4  �3  
�2 
ascr
�1 
txdl�0 0 	old_delim  
�/ 
ctxt
�. 
prmt
�- 
dfnm
�, 
dflc
�+ afdmdesk
�* .earsffdralis        afdr�) 
�( .sysonwflfile    ��� null�' 0 	save_file 	save_File
�& 
perm
�% .rdwropenshor       file
�$ 
refn
�# .rdwrwritnull���     ****
�" .rdwrclosnull���     ****�J>jvE�O*j �&E�Ob   �%�%E�O� w*j O*�k/E�O g�[��l kh   L F��-[��l kh ��,E�O�a ,E` Oa �%_ %_ %_ %_ %E` O_ �6G[OY��W X  h[OY��UO_ a ,E` O_ _ a ,FO�_ %_ %_ %�%a &E�O_ _ a ,FOa  +*j O*a a a b   a a  j !a " #E` $UOa % 7_ $a &%�&a 'el (E` $O �a )_ $l *W X  hO_ $j +Uascr  ��ޭ