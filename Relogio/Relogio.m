//
//  Relogio.m
//  Relogio
//
//  Created by Rafael Brigagão Paulino on 16/10/12.
//  Copyright (c) 2012 rafapaulino.com. All rights reserved.
//

#import "Relogio.h"

@implementation Relogio

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        NSDate *momentoAtual = [NSDate date];
        
        NSDateFormatter *formatador = [[NSDateFormatter alloc] init];
        
        [formatador setDateFormat:@"HH:mm:ss"];
        
        NSString *stringData = [formatador stringFromDate:momentoAtual];
        
        NSLog(@"%@",stringData);
        
        NSArray *array = [stringData componentsSeparatedByString:@":"];
        
        hora = [[array objectAtIndex:0] floatValue];
        minuto = [[array objectAtIndex:0] floatValue];
        segundo = [[array objectAtIndex:0] floatValue];
        
        anguloSegundo = -(2*M_PI)*(segundo/60);
        anguloMinuto = -(2*M_PI)*(minuto/60) + anguloSegundo/60;
        anguloHora = -(2*M_PI)*(hora/12) + anguloMinuto/60;
        
        NSLog(@"%f",anguloHora);
        NSLog(@"%f",anguloMinuto);
        NSLog(@"%f",anguloSegundo);
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    //pegar a referencia da nossa tela para poder desenhar nela
    CGContextRef contexto = UIGraphicsGetCurrentContext();
    
    //BOLA PRETA
    
    //setar a cor de preenchimento
    CGContextSetRGBFillColor(contexto, 0, 0, 0, 1);
    //desenhar uma elipse na tela
    CGContextFillEllipseInRect(contexto, CGRectMake(rect.origin.x+20, rect.origin.y+20, rect.size.width-40, rect.size.height-40));
    
    //BOLA BRANCA
    
    //setar a cor de preenchimento
    CGContextSetRGBFillColor(contexto, 1, 1, 1, 1);
    //desenhar uma elipse na tela
    CGContextFillEllipseInRect(contexto, CGRectMake(rect.origin.x+30, rect.origin.y+30, rect.size.width-60, rect.size.height-60));
    
    
    //iniciar o desenho de uma linha - PONTEIRO SEGUNDOS
    CGContextBeginPath(contexto);
    
    //definir o ponto inicial da reta
    CGContextMoveToPoint(contexto, rect.size.width/2, rect.size.height/2);
    
    //definir o ponto final da reta
    CGContextAddLineToPoint(contexto, rect.size.width/2 - sin(anguloSegundo)*60, rect.size.height/2 - cos(anguloSegundo)*60);
    
    //setar a cor da reta
    CGContextSetRGBStrokeColor(contexto, 1, 0, 0, 1);
    
    //setar a largura da linha
    CGContextSetLineWidth(contexto, 1);
    
    //mandar desenhar alinha
    CGContextStrokePath(contexto);
    
    //atualizar o angulo do ponteiro de segundos
    anguloSegundo = anguloSegundo - (2*M_PI/60);
    
    
    //iniciar o desenho de uma linha - PONTEIRO MINUTO
    CGContextBeginPath(contexto);
    
    //definir o ponto inicial da reta
    CGContextMoveToPoint(contexto, rect.size.width/2, rect.size.height/2);
    
    //definir o ponto final da reta
    CGContextAddLineToPoint(contexto, rect.size.width/2 - sin(anguloMinuto)*50, rect.size.height/2 - cos(anguloMinuto)*50);
    
    //setar a cor da reta
    CGContextSetRGBStrokeColor(contexto, 0, 0, 0, 1);
    
    //setar a largura da linha
    CGContextSetLineWidth(contexto, 2);
    
    //mandar desenhar alinha
    CGContextStrokePath(contexto);
    
    //atualizar o angulo do ponteiro de segundos
    anguloMinuto = anguloMinuto - (2*M_PI/(60*60));
    
    
    //iniciar o desenho de uma linha - PONTEIRO HORA
    CGContextBeginPath(contexto);
    
    //definir o ponto inicial da reta
    CGContextMoveToPoint(contexto, rect.size.width/2, rect.size.height/2);
    
    //definir o ponto final da reta
    CGContextAddLineToPoint(contexto, rect.size.width/2 - sin(anguloHora)*35, rect.size.height/2 - cos(anguloHora)*35);
    
    //setar a cor da reta
    CGContextSetRGBStrokeColor(contexto, 1, 1, 0, 1);
    
    //setar a largura da linha
    CGContextSetLineWidth(contexto, 3);
    
    //mandar desenhar alinha
    CGContextStrokePath(contexto);
    
    //atualizar o angulo do ponteiro de segundos
    anguloHora = anguloHora - (2*M_PI/(60*60*60));

    
    
    //pedir para tela se redesenhar daqui 1s
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(setNeedsDisplay) userInfo:nil repeats:NO];
    
    
    
}


@end
