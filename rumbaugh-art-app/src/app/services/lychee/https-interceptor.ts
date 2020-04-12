import { Injectable } from "@angular/core";
import { HttpInterceptor, HttpRequest, HttpHandler, HttpEvent } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';

@Injectable()
export class HttpsInterceptor implements HttpInterceptor {
    intercept(request: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
        let secureReq = request;
        
        if (environment.production) {
            secureReq = request.clone({
                url: request.url.replace('http://', 'https://')
            });
        }
        
        return next.handle(secureReq);
    }
}