JsOsaDAS1.001.00bplist00�VscriptoL� / * * 
   *   C o p y r i g h t   2 0 1 6   M . G . B .   T e u t e l i n k 
   * 
   *   L i c e n s e d   u n d e r   t h e   A p a c h e   L i c e n s e ,   V e r s i o n   2 . 0   ( t h e   " L i c e n s e " ) ; 
   *   y o u   m a y   n o t   u s e   t h i s   f i l e   e x c e p t   i n   c o m p l i a n c e   w i t h   t h e   L i c e n s e .   
   *   Y o u   m a y   o b t a i n   a   c o p y   o f   t h e   L i c e n s e   a t 
   * 
   *     h t t p : / / w w w . a p a c h e . o r g / l i c e n s e s / L I C E N S E - 2 . 0 
   * 
   *   U n l e s s   r e q u i r e d   b y   a p p l i c a b l e   l a w   o r   a g r e e d   t o   i n   w r i t i n g ,   s o f t w a r e 
   *   d i s t r i b u t e d   u n d e r   t h e   L i c e n s e   i s   d i s t r i b u t e d   o n   a n   " A S   I S "   B A S I S , 
   *   W I T H O U T   W A R R A N T I E S   O R   C O N D I T I O N S   O F   A N Y   K I N D ,   e i t h e r   e x p r e s s   o r   i m p l i e d . 
   *   S e e   t h e   L i c e n s e   f o r   t h e   s p e c i f i c   l a n g u a g e   g o v e r n i n g   p e r m i s s i o n s   a n d 
   *   l i m i t a t i o n s   u n d e r   t h e   L i c e n s e . 
   * / 
 O b j C . i m p o r t ( " C o c o a " ) ; 
 O b j C . i m p o r t ( ' F o u n d a t i o n ' ) ; 
 
 v a r   A p p   =   A p p l i c a t i o n . c u r r e n t A p p l i c a t i o n ( ) ; 
 A p p . i n c l u d e S t a n d a r d A d d i t i o n s   =   t r u e ; 
 
 v a r   P A T H   =   O b j C . u n w r a p ( $ . N S H o m e D i r e c t o r y ( ) )   +   " / L i b r a r y / P r e f e r e n c e s / n l . i n t y m e . m a i l 2 e v e r n o t e . p l i s t " ; 
 v a r   p r o p e r t i e s   =   n e w   P r o p e r t i e s ( P A T H ) ; 
 
 v a r   M a i l   =   A p p l i c a t i o n ( ' M a i l ' ) ; 
 v a r   E v e r n o t e   =   A p p l i c a t i o n ( ' E v e r n o t e ' ) ; 
 v a r   S y s t e m   =   A p p l i c a t i o n ( ' S y s t e m   E v e n t s ' ) ; 
 	 
 / /   T h e   u s e d   b a s e d   t e m p o r a r y   i t e m s   f o l d e r   u s e d   t o   t e m p o r a r y   s t o r e   a t t a c h m e n t s 
 v a r   t e m p F o l d e r N a m e   =   A p p . p a t h T o ( ' t e m p o r a r y   i t e m s ' ,   { f r o m :   ' u s e r   d o m a i n ' } ) ; 
 v a r   t e m p F o l d e r   =   S y s t e m . f o l d e r s . b y N a m e ( t e m p F o l d e r N a m e . t o S t r i n g ( ) ) ; 
 
 / /   A r r a y   w i t h   a t t a c h m e n t s   t h a t   a r e   c o n v e r t e d   i n t o   e m b e d d e d   i m a g e s 
 v a r   e m b e d d e d A t t a c h m e n t s   =   [ ] ; 
 
 / * * 
   *   B a s e 6 4   
   * / 
 v a r   B a s e 6 4 = { _ k e y S t r : " A B C D E F G H I J K L M N O P Q R S T U V W X Y Z a b c d e f g h i j k l m n o p q r s t u v w x y z 0 1 2 3 4 5 6 7 8 9 + / = " , e n c o d e : f u n c t i o n ( e ) { v a r   t = " " ; v a r   n , r , i , s , o , u , a ; v a r   f = 0 ; e = B a s e 6 4 . _ u t f 8 _ e n c o d e ( e ) ; w h i l e ( f < e . l e n g t h ) { n = e . c h a r C o d e A t ( f + + ) ; r = e . c h a r C o d e A t ( f + + ) ; i = e . c h a r C o d e A t ( f + + ) ; s = n > > 2 ; o = ( n & 3 ) < < 4 | r > > 4 ; u = ( r & 1 5 ) < < 2 | i > > 6 ; a = i & 6 3 ; i f ( i s N a N ( r ) ) { u = a = 6 4 } e l s e   i f ( i s N a N ( i ) ) { a = 6 4 } t = t + t h i s . _ k e y S t r . c h a r A t ( s ) + t h i s . _ k e y S t r . c h a r A t ( o ) + t h i s . _ k e y S t r . c h a r A t ( u ) + t h i s . _ k e y S t r . c h a r A t ( a ) } r e t u r n   t } , d e c o d e : f u n c t i o n ( e ) { v a r   t = " " ; v a r   n , r , i ; v a r   s , o , u , a ; v a r   f = 0 ; e = e . r e p l a c e ( / [ ^ A - Z a - z 0 - 9 + / = ] / g , " " ) ; w h i l e ( f < e . l e n g t h ) { s = t h i s . _ k e y S t r . i n d e x O f ( e . c h a r A t ( f + + ) ) ; o = t h i s . _ k e y S t r . i n d e x O f ( e . c h a r A t ( f + + ) ) ; u = t h i s . _ k e y S t r . i n d e x O f ( e . c h a r A t ( f + + ) ) ; a = t h i s . _ k e y S t r . i n d e x O f ( e . c h a r A t ( f + + ) ) ; n = s < < 2 | o > > 4 ; r = ( o & 1 5 ) < < 4 | u > > 2 ; i = ( u & 3 ) < < 6 | a ; t = t + S t r i n g . f r o m C h a r C o d e ( n ) ; i f ( u ! = 6 4 ) { t = t + S t r i n g . f r o m C h a r C o d e ( r ) } i f ( a ! = 6 4 ) { t = t + S t r i n g . f r o m C h a r C o d e ( i ) } } t = B a s e 6 4 . _ u t f 8 _ d e c o d e ( t ) ; r e t u r n   t } , _ u t f 8 _ e n c o d e : f u n c t i o n ( e ) { e = e . r e p l a c e ( / r n / g , " n " ) ; v a r   t = " " ; f o r ( v a r   n = 0 ; n < e . l e n g t h ; n + + ) { v a r   r = e . c h a r C o d e A t ( n ) ; i f ( r < 1 2 8 ) { t + = S t r i n g . f r o m C h a r C o d e ( r ) } e l s e   i f ( r > 1 2 7 & & r < 2 0 4 8 ) { t + = S t r i n g . f r o m C h a r C o d e ( r > > 6 | 1 9 2 ) ; t + = S t r i n g . f r o m C h a r C o d e ( r & 6 3 | 1 2 8 ) } e l s e { t + = S t r i n g . f r o m C h a r C o d e ( r > > 1 2 | 2 2 4 ) ; t + = S t r i n g . f r o m C h a r C o d e ( r > > 6 & 6 3 | 1 2 8 ) ; t + = S t r i n g . f r o m C h a r C o d e ( r & 6 3 | 1 2 8 ) } } r e t u r n   t } , _ u t f 8 _ d e c o d e : f u n c t i o n ( e ) { v a r   t = " " ; v a r   n = 0 ; v a r   r = c 1 = c 2 = 0 ; w h i l e ( n < e . l e n g t h ) { r = e . c h a r C o d e A t ( n ) ; i f ( r < 1 2 8 ) { t + = S t r i n g . f r o m C h a r C o d e ( r ) ; n + + } e l s e   i f ( r > 1 9 1 & & r < 2 2 4 ) { c 2 = e . c h a r C o d e A t ( n + 1 ) ; t + = S t r i n g . f r o m C h a r C o d e ( ( r & 3 1 ) < < 6 | c 2 & 6 3 ) ; n + = 2 } e l s e { c 2 = e . c h a r C o d e A t ( n + 1 ) ; c 3 = e . c h a r C o d e A t ( n + 2 ) ; t + = S t r i n g . f r o m C h a r C o d e ( ( r & 1 5 ) < < 1 2 | ( c 2 & 6 3 ) < < 6 | c 3 & 6 3 ) ; n + = 3 } } r e t u r n   t } } 
 
 / * * 
   *   E n h a n c e s   t h e   S t r i n g   w i t h   a   m e t h o d   t h a t   c a n   b e   u s e d   t o   e x t r a c t   a   
   *   s u b s t r i n g   b e t w e e n   a   p r e f i x   a n d   a   s u f f i x .   I t   i n c l u d e s   t h e   p r e f i x   a n d 
   *   s u f f i x 
   *   @ p a r a m   p r e f i x   t h e   s t a r t   o f   t h e   s u b s t r i n g 
   *   @ p a r a m   s u f f i x   t h e   e n d   o f   t h e   s u b s t r i n g 
   *   @ r e t u r n   t h e   s u b s t r i n g 
   * / 
 S t r i n g . p r o t o t y p e . b e t w e e n   =   f u n c t i o n ( p r e f i x ,   s u f f i x )   { 
 	 s   =   t h i s ; 
 	 v a r   i   =   s . i n d e x O f ( p r e f i x ) ; 
 	 i f   ( i   > =   0 )   { 
 	 	 s   =   s . s u b s t r i n g ( i   +   p r e f i x . l e n g t h ) ; 
 	 }   e l s e   { 
 	 	 r e t u r n   ' ' ; 
 	 } 
 	 i f   ( s u f f i x )   { 
 	 	 i   =   s . i n d e x O f ( s u f f i x ) ; 
 	 	 i f   ( i   > =   0 )   { 
 	 	 	 s   =   s . s u b s t r i n g ( 0 ,   i ) ; 
 	 	 }   e l s e   { 
 	 	 	 r e t u r n   ' ' ; 
 	 	 } 
 	 } 
 	 r e t u r n   p r e f i x   +   s   +   s u f f i x ; 
 } 
 
 / * * 
   *   T h e   m a i n   f u n c t i o n a l i t y   o f   c r e a t i n g   E v e r n o t e   n o t e s   f r o m   s e l e c t e d   M a c   M a i l   m e s s a g e s 
   * / 
 f u n c t i o n   m a i l 2 e v e r n o t e ( )   { 	 
 	 P r o g r e s s . d e s c r i p t i o n   =     " E x p o r t i n g   M a c   M a i l   m e s s a g e s   t o   E v e r n o t e " 
 	 P r o g r e s s . a d d i t i o n a l D e s c r i p t i o n   =   " P r e p a r i n g & " 
 
 	 e m b e d d e d A t t a c h m e n t s   =   [ ] 
 
 	 v a r   m e s s a g e s   =   M a i l . s e l e c t i o n ( ) ; 
 	 
 	 / /   S o r t   m a i l s   b y   d a t e   s e n t 
 	 m e s s a g e s . s o r t ( f u n c t i o n ( a , b )   { r e t u r n   ( a . d a t e S e n t ( )   >   b . d a t e S e n t ( ) )   ?   1   :   ( ( b . d a t e S e n t ( )   >   a . d a t e S e n t ( ) )   ?   - 1   :   0 ) ; }   ) ;   
 
 	 P r o g r e s s . t o t a l U n i t C o u n t   =   m e s s a g e s . l e n g t h ; 
 
 	 / /   L o o p   t h r o u g h   a l l   m a i l   m e s s a g e s   a n d   e x p o r t   t o   E v e r n o t e 
 	 f o r ( v a r   i   =   0 ,   s i z e   =   m e s s a g e s . l e n g t h ;   i   <   s i z e   ;   i + + )   { 
 	 	 v a r   m e s s a g e   =   m e s s a g e s [ i ] ; 
 
 	 	 / /   C h e c k   f o r   e x i s t e n c e   o f   m a i l   m e s s a g e   i n   E v e r n o t e .   
 	 	 / /   T h i s   i s   d o n e   b y   s e a r c h i n g   o n   t h e   m a i l   m e s s a g e ' s   m e s s a g e   I D . 
 	 	 v a r   s o u r c e U R L   =   " m e s s a g e : \ / \ / % 3 c "   +   m e s s a g e . m e s s a g e I d ( )   +   " % 3 e " ; 
 	 	 v a r   n o t e s   =   E v e r n o t e . f i n d N o t e s ( " s o u r c e u r l : "   +   s o u r c e U R L ) ; 
 	 	 i f   ( n o t e s   & &   n o t e s . l e n g t h   >   0 )   { 
 	 	 	 i f   ( p r o p e r t i e s . g e t V a l u e W i t h D e f a u l t ( " o v e r w r i t e P r e v i o u s l y E x p o r t e d M a i l M e s s a g e s " ,   $ . N S O n S t a t e )   = =   $ . N S O n S t a t e )   { 
 	 	 	 	 E v e r n o t e . d e l e t e ( n o t e s [ 0 ] ) ; 
 	 	 	 } 
 	 	 } 
 
 	 	 / /   c r e a t e   a   n e w   E v e r n o t e   n o t e   f r o m   t h e   o r i g i n a l   m a i l   m e s s a g e 
 	 	 v a r   n e w N o t e   =   c r e a t e N o t e ( m e s s a g e ) ; 
 	 	 
 	 	 E v e r n o t e . s y n c h r o n i z e ( ) ; 
 	 	 
 	 	 / /   S h o w   p r o g r e s s 
 	 	 P r o g r e s s . a d d i t i o n a l D e s c r i p t i o n   =   m e s s a g e . s u b j e c t ( ) ; 
         	 P r o g r e s s . c o m p l e t e d U n i t C o u n t   =   i 	 	 
 	 } 
 	 
 	 A p p . d i s p l a y N o t i f i c a t i o n ( " S u c c e s f u l l y   i m p o r t e d   "   +   m e s s a g e s . l e n g t h   +   "   m a i l   m e s s a g e s   i n t o   E v e r n o t e ! " ) ; 
 } 
 
 / * * 
   *   C r e a t e s   a   n e w   E v e r n o t e   n o t e   f r o m   a   M a c   M a i l   m e s s a g e . 
   *   @ p a r a m   m e s s a g e   t h e   o r i g i n a l   m a i l   m e s s a g e 
   *   @ r e t u r n   t h e   n e w l y   c r e a t e d   E v e r n o t e   n o t e 
   * / 
 f u n c t i o n   c r e a t e N o t e ( m e s s a g e )   { 
 	 v a r   n e w N o t e ; 
 	 
 	 v a r   s o u r c e   =   m e s s a g e . s o u r c e ( ) ; 
 	 
 	 v a r   h e a d e r   =   e x t r a c t H e a d e r ( m e s s a g e ) ; 
 	 i f   ( h e a d e r . i n c l u d e s ( " C o n t e n t - T y p e :   t e x t / p l a i n " ) )   { 
 	 	 / /   T h e   m e s s a g e   i s   a   p l a i n   t e x t   m a i l   m e s s a g e 
 	 	 v a r   t e x t   =   " " ; 
 	 	 i f   ( h e a d e r . i n c l u d e s ( " C o n t e n t - T r a n s f e r - E n c o d i n g :   b a s e 6 4 " ) )   { 
 	 	 	 t e x t   =   B a s e 6 4 . d e c o d e ( e x t r a c t B o d y ( m e s s a g e ) ) ; 
 	 	 }   e l s e   { 
 	 	 	 t e x t   =   m e s s a g e . c o n t e n t ( ) ; 
 	 	 } 	 
 
 	 	 n e w N o t e   =   E v e r n o t e . c r e a t e N o t e ( { 
 	 	 	 t i t l e :   m e s s a g e . s u b j e c t ( ) ,   
 	 	 	 t a g s :   [ " m a i l 2 e v e r n o t e " ] , 
 	 	 	 c r e a t e d :   m e s s a g e . d a t e S e n t ( ) , 
 	 	 	 w i t h T e x t :   m e s s a g e . c o n t e n t ( ) 
 	 	 } ) ; 
 	 	 
 	 	 v a r   c o n t e n t   =   n e w N o t e . h t m l C o n t e n t ( ) ; 
 	 	 i f   ( p r o p e r t i e s . g e t V a l u e W i t h D e f a u l t ( " a d d H e a d e r s " ,   $ . N S O n S t a t e )   = =   $ . N S O n S t a t e )   { 
 	 	 	 c o n t e n t   =   c r e a t e N o t e H e a d e r ( m e s s a g e )   +   c o n t e n t ; 
 	 	 } 
 	 	 n e w N o t e . h t m l C o n t e n t   =   c o n t e n t ; 
 	 	 
 	 }   e l s e   { 
 	 	 / /   T h e   m e s s a g e   i s   a n   H T M L   b a s e d   m a i l   m e s s a g e 
 	 	 v a r   c o n t e n t   =   e x t r a c t H T M L ( m e s s a g e ) ; 
 	 	 c o n t e n t   =   e m b e d A t t a c h m e n t s ( m e s s a g e ,   c o n t e n t ) ; 
 	 	 i f   ( p r o p e r t i e s . g e t V a l u e W i t h D e f a u l t ( " a d d H e a d e r s " ,   $ . N S O n S t a t e )   = =   $ . N S O n S t a t e )   { 
 	 	 	 c o n t e n t   =   c o n t e n t . r e p l a c e ( / ( \ < b o d y [ ^ \ > ] * \ > ) / ,   " $ 1 "   +   c r e a t e N o t e H e a d e r ( m e s s a g e ) ) ; 
 	 	 } 
 
 	 	 n e w N o t e   =   E v e r n o t e . c r e a t e N o t e ( { 
 	 	 	 t i t l e :   m e s s a g e . s u b j e c t ( ) ,   
 	 	 	 t a g s :   [ " m a i l 2 e v e r n o t e " ] , 
 	 	 	 c r e a t e d :   m e s s a g e . d a t e S e n t ( ) , 
 	 	 	 w i t h H t m l :   c o n t e n t 
 	 	 } ) ; 
 	 } 
 
 	 / /   T h e   s o u r c e   U R L 	 
 	 n e w N o t e . s o u r c e U R L   =   " m e s s a g e : \ / \ / % 3 c "   +   m e s s a g e . m e s s a g e I d ( )   +   " % 3 e " ; 
 
 	 / /   A t t a c h m e n t s 
 	 v a r   f o o t e r   =   " " ; 
 	 v a r   a t t a c h m e n t s   =   c r e a t e A t t a c h m e n t s ( n e w N o t e ,   m e s s a g e ) ; 
 	 f o r ( v a r   i   =   0 ,   s i z e   =   a t t a c h m e n t s . l e n g t h ;   i   <   s i z e   ;   i + + )   { 
 	 	 v a r   a t t a c h m e n t   =   a t t a c h m e n t s [ i ] ; 
 	 	 f o o t e r   + =   " < e n - m e d i a   t y p e = ' "   +   a t t a c h m e n t . m i m e ( )   +   " '   h a s h = ' "   +   a t t a c h m e n t . h a s h ( )   +   " ' / > " 
 	 } 
 	 f o o t e r   + =   " < h r / > " ; 
 	 E v e r n o t e . a p p e n d ( n e w N o t e ,   { h t m l :   f o o t e r } ) ; 
 	 
 	 i f   ( p r o p e r t i e s . g e t V a l u e W i t h D e f a u l t ( " a d d O r i g i n a l M e s s a g e s " ,   $ . N S O n S t a t e )   = =   $ . N S O n S t a t e )   { 
 	 	 / /   A t t a c h   t h e   o r i g i n a l   E m a i l   r e f e r e n c e 
 	 	 c r e a t e O r i g i n a l E m a i l R e f e r e n c e ( n e w N o t e ,   m e s s a g e ) ; 
 	 } 
 
 	 r e t u r n   n e w N o t e ; 
 } 
 
 / * * 
   *   E x t r a c t s   t h e   h e a d e r   o f   t h e   o r i g i n a l   m a i l   m e s s a g e 
   *   @ p a r a m   m e s s a g e   t h e   o r i g i n a l   m a i l   m e s s a g e 
   *   @ r e t u r n   t h e   h e a d e r 
   * / 
 f u n c t i o n   e x t r a c t H e a d e r ( m e s s a g e )   { 
 	 v a r   s o u r c e   =   m e s s a g e . s o u r c e ( ) ; 
 	 r e t u r n   s o u r c e . s u b s t r i n g ( 0 ,   s o u r c e . i n d e x O f ( " M I M E - V e r s i o n :   1 . 0 " )   +   " M I M E - V e r s i o n :   1 . 0 " . l e n g t h ) ; 
 } 
 
 / * * 
   *   E x t r a c t s   t h e   b o d y   o f   t h e   o r i g i n a l   m a i l   m e s s a g e 
   *   @ p a r a m   m e s s a g e   t h e   o r i g i n a l   m a i l   m e s s a g e 
   *   @ r e t u r n   t h e   b o d y 
   * / 
 f u n c t i o n   e x t r a c t B o d y ( m e s s a g e )   { 
 	 v a r   s o u r c e   =   m e s s a g e . s o u r c e ( ) ; 
 	 v a r   s   =   s o u r c e . s p l i t ( / M I M E - V e r s i o n :   1 . 0 / ) ; 
 	 i f   ( s )   { 
 	 	 r e t u r n   s [ 1 ] ; 
 	 } 
 	 r e t u r n   " " ; 
 } 
 
 / * *   
   *   E x t r a c t s   H T M L   f r o m   t h e   o r i g i n a l   m a i l   m e s s a g e 
   *   @ p a r a m   m e s s a g e   t h e   o r i g i n a l   m a i l   m e s s a g e 
   *   @ r e t u r n   H T M L 
   * / 
 f u n c t i o n   e x t r a c t H T M L ( m e s s a g e )   { 
 	 v a r   s o u r c e   =   m e s s a g e . s o u r c e ( ) ; 
 	 v a r   h e a d e r   =   e x t r a c t H e a d e r ( m e s s a g e ) ; 
 
 	 / /   T r y   f i n d i n g   t h e   H T M L   c o n t e n t   b y   l o o k i n g   f o r   H T M L   t a g s   
 	 v a r   h t m l   =   s o u r c e . b e t w e e n ( " < h t m l " ,   " / h t m l > " ) ; 	 
 	 i f   ( h t m l )   { 
 	 	 h t m l   =   h t m l . s u b s t r i n g ( h t m l . l a s t I n d e x O f ( " < h t m l > " ) ) 
 
 	 	 h t m l   =   d e c o d e Q u o t e d P r i n t a b l e ( h t m l ) ; 
 	 	 h t m l   =   f i x D o u b l e L i n e S p a c i n g ( h t m l ) ; 
 	 	 r e t u r n   h t m l ; 
 	 } 
 
 	 i f   ( h e a d e r . i n c l u d e s ( " C o n t e n t - T y p e :   m u l t i p a r t " ) )   { 
 	 	 / /   T r y   f i n d i n g   t h e   B a s e 6 4   c o n t e n t   b y   i t e r a t i n g   o v e r   b o u n d a r y   r e f e r e n c e s 
 	 	 v a r   r e g e x   =   / b o u n d a r y = " ( [ ^ " ] * ) " / g ; 
 	 	 w h i l e ( m a t c h e s   =   r e g e x . e x e c ( s o u r c e ) )   { 
 	 	 	 v a r   b o u n d a r y   =   m a t c h e s [ 1 ] ; 
 	 	 	 v a r   b o d y   =   s o u r c e . b e t w e e n ( " - - " + b o u n d a r y + " \ n C o n t e n t - T y p e :   t e x t / h t m l " ,   " - - " + b o u n d a r y + " - - " ) ; 
 	 	 	 i f   ( b o d y )   { 
 	 	 	 	 i f   ( b o d y . i n c l u d e s ( " C o n t e n t - T r a n s f e r - E n c o d i n g :   b a s e 6 4 " ) )   { 
 	 	 	 	 	 v a r   b a s e 6 4   =   b o d y . s u b s t r i n g ( b o d y . i n d e x O f ( " C o n t e n t - T r a n s f e r - E n c o d i n g :   b a s e 6 4 " )   +   " C o n t e n t - T r a n s f e r - E n c o d i n g :   b a s e 6 4 " . l e n g t h ) 
 	 	 	 	 	 	 	 . r e p l a c e ( " - - " + b o u n d a r y + " - - " ,   " " ) 
 	 	 	 	 	 	 	 . r e p l a c e ( / [   \ t \ n ] / g ,   " " ) ; 	 
 	 	 	 	 	 v a r   h t m l   =   B a s e 6 4 . d e c o d e ( b a s e 6 4 ) ; 
 	 	 	 	 	 r e t u r n   h t m l ; 
 	 	 	 	 }   e l s e   
 	 	 	 	 i f   ( b o d y . i n c l u d e s ( " c o n t e n t - t r a n s f e r - e n c o d i n g :   q u o t e d - p r i n t a b l e " ) )   { 
 	 	 	 	 	 v a r   h t m l   =   b o d y . s u b s t r i n g ( b o d y . i n d e x O f ( " C o n t e n t - T r a n s f e r - E n c o d i n g :   q u o t e d - p r i n t a b l e " )   +   " C o n t e n t - T r a n s f e r - E n c o d i n g :   q u o t e d - p r i n t a b l e " . l e n g t h ) 
 	 	 	 	 	 h t m l   =   d e c o d e Q u o t e d P r i n t a b l e ( h t m l ) ; 
 	 	 	 	 	 h t m l   =   f i x D o u b l e L i n e S p a c i n g ( h t m l ) ; 
 	 	 	 	 	 r e t u r n   h t m l ; 
 	 	 	 	 } 
 	 	 	 } 	 
 	 	 } 
 	 } 
 	 
 	 / /   T r y   f i n d i n g   t h e   B a s e 6 4   c o n t e n t   b y   s p l i t t i n g   t h e   m e s s a g e   i n   t w o   p a r t s 
 	 i f   ( h e a d e r . i n c l u d e s ( " C o n t e n t - T y p e :   t e x t / h t m l " )   & &   h e a d e r . i n c l u d e s ( " C o n t e n t - T r a n s f e r - E n c o d i n g :   b a s e 6 4 " ) )   { 
 	 	 / /   T h e   m e s s a g e   i s   a   b a s e 6 4   e n c o d e d   h t m l   m a i l   m e s s a g e 
 	 	 v a r   s   =   s o u r c e . s p l i t ( / M I M E - V e r s i o n :   1 . 0 / ) ; 
 	 	 i f   ( s )   { 
 	 	 	 r e t u r n   B a s e 6 4 . d e c o d e ( s [ 1 ] ) ; 	 
 	 	 } 
 	 } 
 
 	 / /   O t h e r w i s e   r e t u r n   e m p t y   H T M L   d o c u m e n t 
 	 r e t u r n   " < h t m l > < b o d y > < / b o d y > < / h t m l > " ; 
 } 
 
 / * * 
   *   E m b e d s   a l l   C I D :   b a s e d   a t t a c h m e n t s   a s   B A S E 6 4   i n s i d e   t h e   H T M L 
   *   @ p a r a m   m e s s a g e   t h e   o r i g i n a l   m a i l   m e s s a g e 
   *   @ p a r a m   t h e   H T M L   b a s e d   c o n t e n t   w i t h   C I D :   r e f e r e n c e s 
   *   @ r e t u r n   t h e   H T M L   b a s e d   c o n t e n t   w h e r e   C I D :   r e f e r e n c e s   a r e   r e p l a c e d   b y   B A S E 6 4   d a t a 
   * / 
 f u n c t i o n   e m b e d A t t a c h m e n t s ( m e s s a g e ,   c o n t e n t )   { 
 	 v a r   s o u r c e   =   m e s s a g e . s o u r c e ( ) ; 	 
 	 
 	 / /   I t e r a t e   t h r o u g h   a l l   b o u n d a r i e s 
 	 v a r   r e g e x   =   / b o u n d a r y = " ( [ ^ " ] * ) " / g ; 
 	 w h i l e ( m a t c h e s   =   r e g e x . e x e c ( s o u r c e ) )   { 
 	 	 v a r   b o u n d a r y   =   m a t c h e s [ 1 ] ; 
 	 	 
 	 	 / /   E x t r a c t   t h e   b o d y   o f   t h e   b o u n d a r y 	 
 	 	 v a r   b o d y   =   s o u r c e . b e t w e e n ( " - - " + b o u n d a r y + " \ n C o n t e n t - T y p e :   i m a g e " ,   " - - " + b o u n d a r y + " - - " ) ; 
 
 	 	 / /   I t e r a t e   t h r o u g h   a l l   a t t a c h m e n t s   w i t h i n   t h e   b o u n d a r y ' s   b o d y 
 	 	 v a r   r   =   / C o n t e n t - T y p e :   ( [ ^ ; ] * ) ;   n a m e = " ( [ ^ " ] * ) " / g ; 
 	 	 w h i l e   ( c t n   =   r . e x e c ( b o d y ) )   { 
 	 	 	 v a r   c o n t e n t T y p e   =   c t n [ 1 ] ; 
 	 	 	 v a r   n a m e   =   c t n [ 2 ] ; 
 	 	 	 
 	 	 	 v a r   b   =   b o d y . b e t w e e n ( c t n [ 0 ] ,   " - - " ) ; 
 	 	 	 i f ( c i d   =   / C o n t e n t - I D :   < ( [ ^ > ] * ) > / . e x e c ( b ) )   { 
 	 	 	 	 v a r   c o n t e n t I d   =   c i d [ 1 ] ; 
 	 	 	 	 i f   ( c o n t e n t . i n c l u d e s ( " c i d : " + c o n t e n t I d ) )   { 	 	 
 	 	 	 	 	 v a r   b a s e 6 4   =   b . s u b s t r i n g ( b . i n d e x O f ( " C o n t e n t - T r a n s f e r - E n c o d i n g :   b a s e 6 4 " )   +   " C o n t e n t - T r a n s f e r - E n c o d i n g :   b a s e 6 4 " . l e n g t h ) 
 	 	 	 	 	 	 	 	 	 . r e p l a c e ( " - - " ,   " " ) 
 	 	 	 	 	 	 	 	 	 . r e p l a c e ( / [   \ t \ n ] / g ,   " " ) ; 
 
 	 	 	 	 	 / /   R e m e m b e r   t h e   a t t a c h m e n t   n a m e s   t h a t   h a v e   b e e n   e m b e d d e d ,   s o   t h e y   c a n   b e   r e m o v e d   f r o m   t h e   a t t a c h m e n t s 
 	 	 	 	 	 e m b e d d e d A t t a c h m e n t s . p u s h ( n a m e ) ; 
 	 	 	 	 	 
 	 	 	 	 	 / /   R e p l a c e   t h e   C I D   r e f e r e n c e s   w i t h   e m b e d d e d   b a s e 6 4 
 	 	 	 	 	 c o n t e n t   =   c o n t e n t . r e p l a c e ( n e w   R e g E x p ( " c i d : " + c o n t e n t I d ,   ' g ' ) ,   " d a t a : " + c o n t e n t T y p e + " ; b a s e 6 4 , " + b a s e 6 4 ) ; 
 	 	 	 	 } 
 	 	 	 } 
 	 	 } 
 	 } 
 	 r e t u r n   c o n t e n t ; 
 } 	 
 
 / * * 
   *   A d d s   a l l   a t t a c h m e n t s   t h a t   a r e   n o t   e m b e d d e d   i m a g e s   t o   t h e   E v e r n o t e   n o t e . 
   *   @ p a r a m   n e w N o t e   t h e   E v e r n o t e   n o t e 
   *   @ p a r a m   m e s s a g e   t h e   o r i g i n a l   m a i l   m e s s a g e 
   * / 
 f u n c t i o n   c r e a t e A t t a c h m e n t s ( n e w N o t e ,   m e s s a g e )   { 
 	 v a r   h t m l   =   " " ; 
 	 
 	 v a r   a t t a c h m e n t s   =   m e s s a g e . m a i l A t t a c h m e n t s ( ) ; 
 	 f o r ( v a r   i   =   0 ,   s i z e   =   a t t a c h m e n t s . l e n g t h ;   i   <   s i z e   ;   i + + )   { 
 	 	 v a r   a t t a c h m e n t   =   a t t a c h m e n t s [ i ] ; 
 	 	 
 	 	 / /   S k i p   a l l   a t t a c h m e n t s   t h a t   h a v e   b e e n   e m b e d d e d   a s   b a s e 6 4   e n c o d e d   d a t a   i n s i d e   I M G   t a g s 
 	 	 i f   ( ! e m b e d d e d A t t a c h m e n t s   | |   ( e m b e d d e d A t t a c h m e n t s . i n d e x O f ( a t t a c h m e n t . n a m e ( ) )   = =   - 1 ) )   { 
 	 	 	 v a r   f i l e P a t h   =   P a t h ( t e m p F o l d e r N a m e   +   " / "   +   a t t a c h m e n t . n a m e ( ) ) ; 
 	 	 	 a t t a c h m e n t . s a v e ( { i n :   f i l e P a t h } ) ; 
 	 	 	 n e w N o t e . a p p e n d ( { a t t a c h m e n t :   f i l e P a t h } ) ; 
 	 	 
 	 	 	 S y s t e m . d e l e t e ( t e m p F o l d e r . f i l e s . b y N a m e ( a t t a c h m e n t . n a m e ( ) ) ) ; 
 	 	 } 
 	 } 
 	 r e t u r n   n e w N o t e . a t t a c h m e n t s ( ) ; 
 } 
 
 
 / * * 
   *   C r e a t e s   a n   e m a i l   . E M L   f i l e   f r o m   t h e   o r i g i n a l   e m a i l   a n   a t t a c h   i t   t o   t h e   E v e r n o t e   n o t e . 
   *   @ p a r a m   n e w N o t e   t h e   E v e r n o t e   n o t e 
   *   @ p a r a m   m e s s a g e   t h e   o r i g i n a l   m a i l   m e s s a g e   
   * / 
 f u n c t i o n   c r e a t e O r i g i n a l E m a i l R e f e r e n c e ( n e w N o t e ,   m e s s a g e )   { 
 	 v a r   f i l e n a m e   =   P a t h ( t e m p F o l d e r N a m e   +   " / O r i g i n a l   E m a i l . e m l " ) ; 
 	 v a r   e m l   =   A p p . o p e n F o r A c c e s s ( f i l e n a m e ,   { w r i t e P e r m i s s i o n :   t r u e } ) ; 
 	 A p p . w r i t e ( m e s s a g e . s o u r c e ( ) ,   { t o :   e m l ,   a s :   ' t e x t ' } ) ; 
 	 A p p . c l o s e A c c e s s ( e m l ) ; 
 	 
 	 n e w N o t e . a p p e n d ( { a t t a c h m e n t :   f i l e n a m e } ) ; 
 	 	 	 	 
 	 S y s t e m . d e l e t e ( t e m p F o l d e r . f i l e s . b y N a m e ( " O r i g i n a l   E m a i l . e m l " ) ) ; 
 } 
 
 / * * 
   *   R e t r i e v e s   t h e   a t t a c h m e n t   b y   i t s   n a m e   
   *   @ p a r a m   a t t a c h m e n t s   a l l   a t t a c h m e n t s 
   *   @ p a r a m   n a m e   t h e   a t t a c h m e n t   n a m e 
   *   @ r e t u r n   t h e   a t t a c h m e n t 
   * / 
 f u n c t i o n   g e t A t t a c h m e n t B y N a m e ( a t t a c h m e n t s ,   n a m e )   { 
 	 f o r ( v a r   i   =   0 ,   s i z e   =   a t t a c h m e n t s . l e n g t h ;   i   <   s i z e   ;   i + + )   { 
 	 	 i f   ( a t t a c h m e n t s [ i ] . f i l e n a m e ( )   = =   n a m e )   { 
 	 	 	 r e t u r n   a t t a c h m e n t s [ i ] ; 
 	 	 } 
 	 } 
 	 r e t u r n   n u l l ; 
 } 
 
 / * * 
   *   C r e a t e s   a n   H T M L   b a s e d   h e a d e r   w i t h   t h e   D a t e ,   F r o m ,   T o ,   C C   a n d   t h e   S u b j e c t   o f   t h e   o r i g i n a l   e m a i l 
   *   @ p a r a m   m e s s a g e   t h e   o r i g i n a l   e m a i l   m e s s a g e 
   *   r e t u r n   t h e   H T M L   b a s e d   h e a d e r 
   * / 
 f u n c t i o n   c r e a t e N o t e H e a d e r ( m e s s a g e )   { 
 
 	 v a r   t e m p l a t e   =   
 	 	 " < t a b l e   b o r d e r = ' 0 '   w i d t h = ' 1 0 0 % '   c e l l s p a c i n g = ' 0 '   c e l l p a d d i n g = ' 2 ' > "   + 
 	 	     " < t b o d y > " ; 
 	 	     
 	 / *   D A T E / T I M E   * / 
 	 t e m p l a t e   + = 
 	 	         " < t r   b g c o l o r = ' # f f f f f f ' > "   + 
 	 	             " < t d   v a l i g n = ' t o p ' > < f o n t   c o l o r = ' # 7 9 7 9 7 9 ' > < s t r o n g > D a t e :   < / s t r o n g > < / t d > "   + 
 	 	             " < t d   v a l i g n = ' t o p ' > "   +   m e s s a g e . d a t e R e c e i v e d ( )   +   " < / t d > "   + 
 	 	 	 " < / t r > " ; 
 
 	 / *   F R O M   * / 
 	 v a r   s e n d e r N a m e   =   m e s s a g e . r e p l y T o ( ) . r e p l a c e ( / ^ [ ^ \ " ] * \ " | \ " . * $ / g i ,   ' ' ) ; 
 	 v a r   s e n d e r A d d r e s s   =   m e s s a g e . r e p l y T o ( ) . r e p l a c e ( / ^ [ ^ < ] * < | > . * $ / g i ,   ' ' ) ; 
 	 t e m p l a t e   + = 
 	 	         " < t r   b g c o l o r = ' # f f f f f f ' > "   + 
 	 	             " < t d   v a l i g n = ' t o p ' > < f o n t   c o l o r = ' # 7 9 7 9 7 9 ' > < s t r o n g > F r o m :   < / s t r o n g > < / t d > "   + 
 	 	             " < t d   v a l i g n = ' t o p ' > < a   h r e f = ' m a i l t o : "   +   s e n d e r A d d r e s s   +   " ' > "   +   s e n d e r N a m e   +   " < / a > < / t d > "   + 
 	 	 	 " < / t r > " ; 
 	 	 	 	 	 	 
 	 / *   T O   * / 
 	 v a r   t o R e c i p i e n t s   =   m e s s a g e . t o R e c i p i e n t s ( ) ; 
 	 i f   ( t o R e c i p i e n t s   & &   ( t o R e c i p i e n t s . l e n g t h   >   0 ) )   { 
 	 	 t e m p l a t e   + = 
 	 	 	 " < t r   b g c o l o r = ' # f f f f f f ' > "   + 
 	 	             " < t d   v a l i g n = ' t o p ' > < f o n t   c o l o r = ' # 7 9 7 9 7 9 ' > < s t r o n g > T o :   < / s t r o n g > < / t d > "   + 
 	 	             " < t d   v a l i g n = ' t o p ' > " ; 
 	 	 f o r ( v a r   i   =   0 ,   s i z e   =   t o R e c i p i e n t s . l e n g t h ;   i   <   s i z e   ;   i + + )   { 
 	 	 	 v a r   t o R e c i p i e n t   =   t o R e c i p i e n t s [ i ] ; 
 	 	 	 i f   ( t o R e c i p i e n t . n a m e ( )   ! =   n u l l )   { 
 	 	 	 	 t e m p l a t e   + =   t o R e c i p i e n t . n a m e ( )   +   "   ( < a   h r e f = ' m a i l t o : "   +   t o R e c i p i e n t . a d d r e s s ( )   +   " ' > "   +   t o R e c i p i e n t . a d d r e s s ( )   +   " < / a > ) < b r / > " ; 
 	 	 	 }   e l s e   { 
 	 	 	 	 t e m p l a t e   + =   " < a   h r e f = ' m a i l t o : "   +   t o R e c i p i e n t . a d d r e s s ( )   +   " ' > "   +   t o R e c i p i e n t . a d d r e s s ( )   +   " < / a > < b r / > " ; 
 	 	 	 } 
 	 	 } 
 	 	 t e m p l a t e   + = 	     
 	 	             " < / t d > "   + 
 	 	 	 " < / t r > " ; 
 	 } 
 
 	 / *   C C   * / 
 	 v a r   c c R e c i p i e n t s   =   m e s s a g e . c c R e c i p i e n t s ( ) ; 
 	 i f   ( c c R e c i p i e n t s   & &   ( c c R e c i p i e n t s . l e n g t h   >   0 ) )   { 
 	 	 t e m p l a t e   + = 
 	 	 	 " < t r   b g c o l o r = ' # f f f f f f ' > "   + 
 	 	             " < t d   v a l i g n = ' t o p ' > < f o n t   c o l o r = ' # 7 9 7 9 7 9 ' > < s t r o n g > C C :   < / s t r o n g > < / t d > "   + 
 	 	             " < t d   v a l i g n = ' t o p ' > " ; 
 	 	 f o r ( v a r   i   =   0 ,   s i z e   =   c c R e c i p i e n t s . l e n g t h ;   i   <   s i z e   ;   i + + )   { 
 	 	 	 v a r   c c R e c i p i e n t   =   c c R e c i p i e n t s [ i ] ; 
 	 	 	 i f   ( c c R e c i p i e n t . n a m e ( )   ! =   n u l l )   { 
 	 	 	 	 t e m p l a t e   + =   c c R e c i p i e n t . n a m e ( )   +   "   ( < a   h r e f = ' m a i l t o : "   +   c c R e c i p i e n t . a d d r e s s ( )   +   " ' > "   +   c c R e c i p i e n t . a d d r e s s ( )   +   " < / a > ) < b r / > " ; 
 	 	 	 }   e l s e   { 
 	 	 	 	 t e m p l a t e   + =   " < a   h r e f = ' m a i l t o : "   +   c c R e c i p i e n t . a d d r e s s ( )   +   " ' > "   +   c c R e c i p i e n t . a d d r e s s ( )   +   " < / a > < b r / > " ; 
 	 	 	 } 
 	 	 } 
 	 	 t e m p l a t e   + = 	     
 	 	             " < / t d > "   + 
 	 	 	 " < / t r > " ; 
 	 } 
 
 
 	 / *   R E F E R E N C E S   * / 
 	 i f   ( p r o p e r t i e s . g e t V a l u e W i t h D e f a u l t ( " a d d R e l a t e d M e s s a g e s " ,   $ . N S O n S t a t e )   = =   $ . N S O n S t a t e )   { 
 	 	 v a r   h e a d e r s   =   m e s s a g e . h e a d e r s ( ) ; 
 	 	 f o r ( v a r   i   =   0 ,   s i z e   =   h e a d e r s . l e n g t h ;   i   <   s i z e   ;   i + + )   { 
 	 	 	 i f   ( h e a d e r s [ i ] . n a m e ( )   = =   ' i n - r e p l y - t o ' )   { 
 	 	 	 	 t e m p l a t e   + = 
 	 	 	 	 	 " < t r   b g c o l o r = ' # f f f f f f ' > "   + 
 	 	 	 	 	 " < t d   v a l i g n = ' t o p ' > < f o n t   c o l o r = ' # 7 9 7 9 7 9 ' > < s t r o n g > I n - R e p l y - T o :   < / s t r o n g > < / t d > "   + 
 	 	 	 	 	 " < t d   v a l i g n = ' t o p ' > " ; 
 	 	 	 
 	 	 	 	 v a r   r e g e x   =   / < ( [ ^ > ] * ) > / g ; 
 	 	 	 	 w h i l e ( m a t c h e s   =   r e g e x . e x e c ( h e a d e r s [ i ] . c o n t e n t ( ) ) )   { 
 	 	 	 	 	 v a r   s o u r c e U R L   =   " m e s s a g e : \ / \ / % 3 c "   +   m a t c h e s [ 1 ]   +   " % 3 e " ; 
 	 	 	 	 	 v a r   n o t e s   =   E v e r n o t e . f i n d N o t e s ( " s o u r c e u r l : "   +   s o u r c e U R L ) ; 
 	 	 	 	 	 i f   ( n o t e s   & &   n o t e s . l e n g t h   >   0 )   { 
 	 	 	 	 	 	 t e m p l a t e   + =   " < a   h r e f = ' "   +   n o t e s [ 0 ] . n o t e L i n k ( )   +   " ' > "   +   n o t e s [ 0 ] . t i t l e ( )   +   " < / a > < b r / > " ; 
 	 	 	 	 	 }   e l s e   { 
 	 	 	 	 	 	 t e m p l a t e   + =   " < a   h r e f = ' m e s s a g e : / / % 3 c "   +   m a t c h e s [ 1 ]   +   " % 3 e ' > "   +   m a t c h e s [ 1 ]   +   " < / a > < b r / > " ; 
 	 	 	 	 	 } 
 	 	 	 	 } 
 	 	 	 
 	 	 	 	 t e m p l a t e   + = 	     
 	 	 	             " < / t d > "   + 
 	 	 	 	 " < / t r > " ; 
 	 	 	 } 
 	 	 } 
 	 } 
 	 
 	 / *   S U B J E C T   * / 
 	 t e m p l a t e   + = 
 	 	         " < t r   b g c o l o r = ' # f f f f f f ' > "   + 
 	 	             " < t d   v a l i g n = ' t o p ' > < f o n t   c o l o r = ' # 7 9 7 9 7 9 ' > < s t r o n g > S u b j e c t :   < / s t r o n g > < / t d > "   + 
 	 	             " < t d   v a l i g n = ' t o p ' > < s t r o n g > "   +   m e s s a g e . s u b j e c t ( )   +   " < / s t r o n g > < / t d > "   + 
 	 	 	 " < / t r > " ; 
 	 	 	 
 	 t e m p l a t e   + = 
 	             " < / t b o d y > "   + 
 	 	 " < / t a b l e > "   + 
 	 	 " < h r / > " ; 
 	 r e t u r n   t e m p l a t e ; 
 } 	 	 	 
 
 f u n c t i o n   w r i t e T o F i l e ( f i l e n a m e ,   t e x t )   { 
 	 v a r   f i l e   =   A p p . o p e n F o r A c c e s s ( f i l e n a m e ,   { w r i t e P e r m i s s i o n :   t r u e } ) ; 
 	 A p p . w r i t e ( t e x t ,   { t o :   f i l e ,   a s :   ' t e x t ' } ) ; 
 	 A p p . c l o s e A c c e s s ( f i l e ) ; 
 } 
 
 / * * 
   *   F i x e s   t h e   d o u b l e   l i n e   p a r a g r a p h   i s s u e   i n   E v e r n o t e   b y   r e p l a c i n g   
   *   t h e   < P > . . . < / P >   i n t o   < D I V > . . . < / D I V > 
   *   @ p a r a m   i n p u t   t h e   s o u r c e   s t r i n g 
   *   @ r e t u r n   t h e   s t r i n g   w i t h o u t   d o u b l e   l i n e   p a r a g r a p h s 
   * / 
 f u n c t i o n   f i x D o u b l e L i n e S p a c i n g ( i n p u t )   { 
 	 / /   r e p l a c e   < p > . . . < / p >   w i t h   < d i v > . . . < / d i v >   t o   a v o i d   e v e r n o t e   g e n e r a t i n g   d o u b l e   l i n e   s p a c i n g 
 	 r e t u r n   i n p u t 
 	 	 . r e p l a c e ( / < p / g ,   ' < d i v ' ) 
 	 	 . r e p l a c e ( / p > / g ,   ' d i v > ' ) ; 
 } 
 
 / * * 
   *   D e c o d e s   a   q u o t e d   p r i n t a b l e   b a s e d   s t r i n g   i n t o   a   v a l i d   H T M L   s t r i n g 
   *   @ p a r a m   i n p u t   t h e   q u o t e d   p r i n t a b l e   s t r i n g 
   *   @ r e t u r n   t h e   v a l i d   H T M L   b a s e d   s t r i n g 
   * / 
 f u n c t i o n   d e c o d e Q u o t e d P r i n t a b l e ( i n p u t )   { 
 	 r e t u r n   i n p u t 
 	 	 / /   h t t p s : / / t o o l s . i e t f . o r g / h t m l / r f c 2 0 4 5 # s e c t i o n - 6 . 7 ,   r u l e   3 : 
 	 	 / /    T h e r e f o r e ,   w h e n   d e c o d i n g   a   ` Q u o t e d - P r i n t a b l e `   b o d y ,   a n y   t r a i l i n g   w h i t e 
 	 	 / /   s p a c e   o n   a   l i n e   m u s t   b e   d e l e t e d ,   a s   i t   w i l l   n e c e s s a r i l y   h a v e   b e e n   a d d e d 
 	 	 / /   b y   i n t e r m e d i a t e   t r a n s p o r t   a g e n t s .  
 	 	 . r e p l a c e ( / [ \ t \ x 2 0 ] $ / g m ,   ' ' ) 
 	 	 / /   R e m o v e   h a r d   l i n e   b r e a k s   p r e c e d e d   b y   ` = ` .   P r o p e r   ` Q u o t e d - P r i n t a b l e ` - 
 	 	 / /   e n c o d e d   d a t a   o n l y   c o n t a i n s   C R L F   l i n e     e n d i n g s ,   b u t   f o r   c o m p a t i b i l i t y 
 	 	 / /   r e a s o n s   w e   s u p p o r t   s e p a r a t e   C R   a n d   L F   t o o . 
 	 	 . r e p l a c e ( / = ( ? : \ r \ n ? | \ n | $ ) / g ,   ' ' ) 
 	 	 / /   D e c o d e   e s c a p e   s e q u e n c e s   o f   t h e   f o r m   ` = X X `   w h e r e   ` X X `   i s   a n y 
 	 	 / /   c o m b i n a t i o n   o f   t w o   h e x i d e c i m a l   d i g i t s .   F o r   o p t i m a l   c o m p a t i b i l i t y , 
 	 	 / /   l o w e r c a s e   h e x a d e c i m a l   d i g i t s   a r e   s u p p o r t e d   a s   w e l l .   S e e 
 	 	 / /   h t t p s : / / t o o l s . i e t f . o r g / h t m l / r f c 2 0 4 5 # s e c t i o n - 6 . 7 ,   n o t e   1 . 
 	 	 . r e p l a c e ( / = ( [ a - f A - F 0 - 9 ] { 2 } ) / g ,   f u n c t i o n ( $ 0 ,   $ 1 )   { 
 	 	 	 v a r   c o d e P o i n t   =   p a r s e I n t ( $ 1 ,   1 6 ) ; 
 	 	 	 r e t u r n   S t r i n g . f r o m C h a r C o d e ( c o d e P o i n t ) ; 
 	 } ) ; 
 } ; 
 
 / * * 
   *   A   c l a s s   t h r o u g h   w h i c h   p r o p e r t i e s   c a n   b e   m a d e   p e r s i s t e n t   i n s i d e   a   . p l i s t   f i l e .   
   *   @ p a r a m   p a t h   t h e   f u l l y   q u a l i f i e d   p a t h   o f   t h e   . p l i s t   p r o p e r t i e s   f i l e . 
   * / 
 f u n c t i o n   P r o p e r t i e s ( p a t h )   { 
 	 t h i s . _ p a t h   =   p a t h ; 
 	 t h i s . _ p r o p e r t i e s   =   { } ; 
 
 	 / /   I n i t i a l i z e   f r o m   f i l e 
 	 v a r   d i c t i o n a r y   =   O b j C . u n w r a p ( $ . N S D i c t i o n a r y . a l l o c . i n i t W i t h C o n t e n t s O f F i l e ( t h i s . _ p a t h ) ) ; 
 	 i f   ( d i c t i o n a r y   ! = =   u n d e f i n e d )   { 
 	 	 t h i s . _ p r o p e r t i e s   =   d i c t i o n a r y ; 
 	 } 
 	 
 	 / * * 
 	   *   R e t r i e v e s   t h e   v a l u e   f o r   t h e   k e y   a n d   s e t s   a n d   r e t u r n s   t h e   d e f a u l t V a l u e 
 	   *   i f   s p e c i f i e d   k e y   h a s   n o   v a l u e   a s s i g n e d   t o   i t   ( y e t ) . 
 	   *   @ p a r a m   k e y   t h e   k e y 
 	   *   @ p a r a m   d e f a u l t V a l u e   t h e   v a l u e   t h a t   i s   a s s i g n e d   t o   t h e   k e y   i n   n o   v a l u e   
 	   *                                           i s   a s s i g n e d   t o   t h e   k e y   ( y e t ) . 
 	   *   @ r e t u r n   t h e   v a l u e   a s s i g n e d   t o   t h e   k e y . 
 	   * /   
 	 t h i s . g e t V a l u e W i t h D e f a u l t   =   f u n c t i o n ( k e y ,   d e f a u l t V a l u e )   { 
 	 	 v a r   r e t v a l   =   t h i s . _ p r o p e r t i e s [ k e y ] ; 
 	 	 i f   ( ( r e t v a l   = =   u n d e f i n e d )   | |   ( r e t v a l   = =   n u l l )   | |   ( O b j C . u n w r a p ( r e t v a l )   = =   ' ' ) )   { 
 	 	 	 t h i s . s e t V a l u e ( k e y ,   d e f a u l t V a l u e ) ; 
 	 	 	 r e t u r n   d e f a u l t V a l u e ; 
 	 	 } 
 	 	 r e t u r n   O b j C . u n w r a p ( r e t v a l ) ; 
 	 } 
 
 	 / * * 
 	   *   R e t r i e v e s   t h e   v a l u e   f o r   t h e   k e y . 
 	   *   @ p a r a m   k e y   t h e   k e y 
 	   *   @ r e t u r n   t h e   v a l u e   a s s i g n e d   t o   t h e   k e y ;   
 	   *                   u n d e f i n e d   i f   n o   v a l u e   i s   a s s i g n e d   t h e   s p e c i f i e d   k e y 
 	   * /   
 	 t h i s . g e t V a l u e   =   f u n c t i o n ( k e y )   { 
 	 	 r e t u r n   O b j C . u n w r a p ( t h i s . _ p r o p e r t i e s [ k e y ] ) ; 
 	 } 
 	 
 	 / * * 
 	   *   S e t s   t h e   v a l u e   f o r   t h e   k e y . 
 	   *   @ p a r a m   k e y   t h e   k e y 
 	   *   @ p a r a m   v a l u e   t h e   v a l u e 
 	   *   @ r e t u r n   t h e   v a l u e   a s s i g n e d   t o   t h e   k e y . 
 	   * /   
 	 t h i s . s e t V a l u e   =   f u n c t i o n ( k e y ,   v a l u e )   { 
 	 	 t h i s . _ p r o p e r t i e s [ k e y ]   =   v a l u e ; 
 	 	 r e t u r n   v a l u e ; 
 	 } 
 	 	 
 	 / * * 
 	   *   S a v e s   t h e   p r o p e r t i e s   i n s i d e   t h e   . p l i s t   f i l e   s p e c i f i e d   b y 
 	   *   t h e   f u l l y   q u a l i f i e d   p a t h 
 	   * /   
 	 t h i s . s a v e   =   f u n c t i o n ( )   { 
 	 	 v a r   d i c t   =   O b j C . w r a p ( t h i s . _ p r o p e r t i e s ) ; 
 	 	 d i c t . w r i t e T o F i l e A t o m i c a l l y ( t h i s . _ p a t h ,   t r u e ) ; 
 	 } 
 } 
                              ��jscr  ��ޭ