function h = plot_function( f, x, varargin )
    y = [];
    
    for x0 = x
        y = [y f(x0, varargin{:})];
    end
    
    h = plot(x, y);
end

