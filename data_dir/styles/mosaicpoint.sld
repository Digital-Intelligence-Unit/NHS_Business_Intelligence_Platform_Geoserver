<?xml version="1.0" encoding="ISO-8859-1"?>
<StyledLayerDescriptor version="1.0.0" 
		xsi:schemaLocation="http://www.opengis.net/sld StyledLayerDescriptor.xsd" 
		xmlns="http://www.opengis.net/sld" 
		xmlns:ogc="http://www.opengis.net/ogc" 
		xmlns:xlink="http://www.w3.org/1999/xlink" 
		xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
		<!-- a named layer is the basic building block of an sld document -->

	<NamedLayer>
		<Name>Default Point</Name>
		<UserStyle>
		    <!-- they have names, titles and abstracts -->
		  
			<Title>A boring default style</Title>
			<Abstract>A sample style that just prints out a purple square</Abstract>
			<!-- FeatureTypeStyles describe how to render different features -->
			<!-- a feature type for points -->

			<FeatureTypeStyle>
				<!--FeatureTypeName>Feature</FeatureTypeName-->
				<Rule>
					<Name>Rule 1</Name>
					<Title>RedSquare</Title>
					<Abstract>A red fill with an 11 pixel size</Abstract>

					<!-- like a linesymbolizer but with a fill too -->
					<PointSymbolizer>
						<Graphic>
							<Mark>
								<WellKnownName>circle</WellKnownName>
								<Fill>
								 <CssParameter name="fill">
								   <ogc:Function name="Recode">
									 <!-- Value to transform -->
									 <ogc:Function name="strTrim">
									   <ogc:PropertyName>mosaicgroup</ogc:PropertyName>
									 </ogc:Function>

									 <!-- Map of input to output values -->
										<ogc:Literal>A</ogc:Literal>	
										<ogc:Literal>#056746</ogc:Literal>
										
										<ogc:Literal>B</ogc:Literal>	
										<ogc:Literal>#4D4885</ogc:Literal>
										
										<ogc:Literal>C</ogc:Literal>	
										<ogc:Literal>#8C78B8</ogc:Literal>
										
										<ogc:Literal>D</ogc:Literal>	
										<ogc:Literal>#2D616D</ogc:Literal>
										
										<ogc:Literal>E</ogc:Literal>	
										<ogc:Literal>#1D4E8C</ogc:Literal>
										
										<ogc:Literal>F</ogc:Literal>	
										<ogc:Literal>#8D8A82</ogc:Literal>
										
										<ogc:Literal>G</ogc:Literal>	
										<ogc:Literal>#71BF44</ogc:Literal>
										
										<ogc:Literal>H</ogc:Literal>	
										<ogc:Literal>#57ABA3</ogc:Literal>
										
										<ogc:Literal>I</ogc:Literal>	
										<ogc:Literal>#CFBC3F</ogc:Literal>
										
										<ogc:Literal>J</ogc:Literal>	
										<ogc:Literal>#857819</ogc:Literal>
										
										<ogc:Literal>K</ogc:Literal>	
										<ogc:Literal>#DB6B6B</ogc:Literal>
										
										<ogc:Literal>L</ogc:Literal>	
										<ogc:Literal>#99377F</ogc:Literal>
										
										<ogc:Literal>M</ogc:Literal>	
										<ogc:Literal>#C37038</ogc:Literal>
										
										<ogc:Literal>N</ogc:Literal>	
										<ogc:Literal>#775A45</ogc:Literal>
										
										<ogc:Literal>O</ogc:Literal>	
										<ogc:Literal>#883236</ogc:Literal>

								   </ogc:Function>
								 </CssParameter>
							   </Fill>
							</Mark>
							<Size>6</Size>
						</Graphic>
					</PointSymbolizer>
				</Rule>

		    </FeatureTypeStyle>
		</UserStyle>
	</NamedLayer>
</StyledLayerDescriptor>