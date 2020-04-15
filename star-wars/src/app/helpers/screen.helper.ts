import { Injectable } from '@angular/core';
import { map, shareReplay } from 'rxjs/operators';
import { Observable } from 'rxjs';
import { MediaMatcher, BreakpointObserver } from '@angular/cdk/layout';

@Injectable({
  providedIn: 'root'
})
export class ScreenHelper {

  isHandset$: Observable<boolean>
  isMedium$: Observable<boolean>;
  isSmall$: Observable<boolean>;
  isXSmall$: Observable<boolean>;
  isSuperXSmall$: Observable<boolean>;


  constructor(
    private breakpointObserver: BreakpointObserver,
    private mediaMathcher: MediaMatcher
  ) {
    
    this.isHandset$ = this.getObservableBreakpoint('(max-width: 959.99px)')
    this.isMedium$ = this.getObservableBreakpoint('(max-width: 700px)')
    this.isSmall$ = this.getObservableBreakpoint('(max-width: 650px)')
    this.isXSmall$ = this.getObservableBreakpoint('(max-width: 490px')
    this.isSuperXSmall$ = this.getObservableBreakpoint('(max-width: 300px)')
  
  }
  
  getObservableBreakpoint(definition: string) : Observable<boolean> {
    return this.breakpointObserver.observe(definition)
      .pipe(
        map(result => result.matches),
        shareReplay()
      );  
  }

}
