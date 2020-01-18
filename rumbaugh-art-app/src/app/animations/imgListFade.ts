import { trigger, transition, style, animate, query, stagger } from '@angular/animations';

export const imgListFade = trigger('imgListFade', [
    transition('* <=> *', [
        query(':enter', 
            [style({ opacity: 0 }), stagger('60ms', animate('600ms ease-out', style({ opacity: 1 })))],
            { optional: true })
    ])
]);