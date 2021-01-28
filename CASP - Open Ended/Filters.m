
function h=Filters(N,Window,ftype,wc1,wc2)
    alpha =(N-1)/2;
    n=0:N-1;
    switch ftype
        case "low"
            hd=sin(wc1*(n-alpha))./(pi*(n-alpha));
            hd(alpha+1)=wc1/pi;
        case "high"
            hd=(sin(pi*(n-alpha))-sin(wc1*(n-alpha)))./(pi*(n-alpha));
            hd(alpha+1)=1-(wc1/pi);
        case "bandpass"
            hd=(sin(wc2*(n-alpha))-sin(wc1*(n-alpha)))./(pi*(n-alpha));
            hd(alpha+1)=(wc2-wc1)/pi;
        case "bandreject"
            hd=(sin(wc1*(n-alpha))-sin(wc2*(n-alpha)))./(pi*(n-alpha))+sin(pi*(n-alpha));
            hd(alpha+1)=1-((wc1-wc2)/pi);
    end
    
    switch Window
        case "ham"
            w=0.54-0.46*cos(2*pi*n/(N-1));
            stem(w)
        case "han"
            w=0.5-0.5*cos(2*pi*n/(N-1));
            stem(w)
        case "tri"
            w=1-2*abs((n-alpha)/(N-1));
            stem(w)
        case "bla"
            w=0.42-0.5*cos(2*pi*n/(N-1))+0.08*cos(4*pi*n/(N-1));
            stem(w)
        case "kai"
            if(A>50)
                b=0.1102*(A-8.7);
            elseif(A<21)
               b=0 ;
            else
                b=0.5842*(((A-21)^0.4)+0.07886*(A-21));
            end
            w=(kaiser(N,b))';
            stem(w)
        otherwise
            w=ones(1,N);
            stem(w)
    end
    size(hd)
    size(w)
    h=hd.*w;
end