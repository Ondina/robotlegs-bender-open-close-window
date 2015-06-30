#Mapping of extended views to mediators

DerivedWindow_A and DerivedWindow_B extend BaseWindowComponent.

BaseWindowComponent implements IBaseWindowComponent.

DerivedWindowMediator_A and DerivedWindowMediator_B extend BaseWindowMediator.
IBaseWindowComponent is injected into BaseWindowMediator.

    mediatorMap.mapMatcher(new TypeMatcher()
		.allOf(IBaseWindowComponent, DerivedWindow_A))
    	.toMediator(DerivedWindowMediator_A);
    		
    mediatorMap.mapMatcher(new TypeMatcher()
		.allOf(IBaseWindowComponent, IDrawRectangles, DerivedWindow_B))
    	.toMediator(DerivedWindowMediator_B);

DerivedWindow_B implements an additional interface, IDrawRectangles, which is injected into 
DerivedWindowMediator_B. As a consequence,  DerivedWindow_B has an additional functionality / behaviour that is mediated by DerivedWindowMediator_B.