function pgfplot( fname, flag3d, step )
% 
% function pgfplot( fname, flag3d, step )
% 
% fname             file name
% flag3d            set true if 3D plot
% step              take only every step'th value
% 
    switch nargin
        case 1
            flag3d = false;
            step = 1;
        case 2
            step = 1;
    end

	c = get( gca, 'Children' );
    i = 1;
    while i < numel(c)
        if ~strcmp( get(c, 'type' ), 'line' )
            c(i) = [];
        else
            i = i+1;
        end
    end
    c = flipud(c);
        
	xdatas = get( c, 'xdata' );
	ydatas = get( c, 'ydata' );

    
    
    if ~flag3d
        if iscell( xdatas )
            for i = numel( xdatas )+1-(1:numel( xdatas ))
                xx = xdatas{i}.';
                yy = ydatas{i}.';
                dlmwrite( [ fname sprintf( '%03i', i ) '.txt' ], [ xx(1:step:end) yy(1:step:end) ], ' ' );
            end
        else
            dlmwrite( [ fname '.txt' ], [ xdatas.' ydatas.' ], ' ' );
        end
    else
        zdatas = get( c, 'zdata' );
        if step > 1
%            xdatas = xdatas( 1:step:end );
%            ydatas = ydatas( 1:step:end );
			zdatas = zdatas( 1:step:end, 1:step:end );
			xdatas = 1:size(zdatas,1);
			ydatas = 1:size(zdatas,2);
        end
        for i = 1:numel(ydatas)
            dlmwrite( [ fname '.txt' ], [ xdatas.' repmat(ydatas(i), [numel(xdatas),1]) transpose( zdatas(i,:,:) ) ], '-append', 'delimiter', ' ' );
			dlmwrite( [ fname '.txt' ], [ ' ' ], '-append' );
        end
    end
end
