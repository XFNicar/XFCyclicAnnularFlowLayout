# XFCyclicAnnularFlowLayout

## CollectionView 实现扇形（环形）布局


<font color= green size=4.5>**功能设置**</font>

* 1.设置有多少层扇形（环形）

* 2.设置该层有多少元素

* 3.设置元素大小Size

* 4.设置该层环绕的半径

* 5.设置该层扇形的展开弧度

* 6.设置所有元素的朝向
    * <font color="#660000">朝上（默认）</font><br />
    * <font color="#660000">朝下</font><br />
    * <font color="#660000">朝里（头部指向圆心）</font><br />
    * <font color="#660000">朝外（头部与环形法线方向一致）</font><br />

* 7.设置该层环形中所有元素是否顺时针排布
    * <font color="#660000">默认是顺时针排布</font><br />

<font color=green , size=4.5>**API说明**</font>


*  <font color=red , size=3>**当前组（环形）有多少个元素**</font>
 
	* <font color="#006666">**- (<font color="#0000dd"> NSInteger </font> )flowLayout:(XFCyclicAnnularFlowLayout *)flowLayout  numberOfItemsInSection:(NSInteger)section;**</font><br />
 
 	* 返回参数类型值说明如下：

    		NSInteger 返回当前所在扇形（环形）区域 cell 数量

*  <font color=red , size=3>**当前组的扇形（环形）半径**</font>
 
	* <font color="#006666">**- (<font color="#0000dd"> CGFloat </font> )flowLayout:(XFCyclicAnnularFlowLayout *)flowLayout cyclicAnnularRadiusInSection:(NSInteger)section;**</font><br />
 
 	* 返回参数类型值说明如下：

    		CGFloat 返回当前组扇形（环形）的半径 (单位: π)

*  <font color=red , size=3>**当前位置Cell的大小（size）**</font>
 
	* <font color="#006666">**- (<font color="#0000dd">CGSize </font> )flowLayout:(XFCyclicAnnularFlowLayout *)flowLayout cyclicAnnularItemSizeAtindexPath:(NSIndexPath *)indexPath;**</font><br />
 
 	* 返回参数类型值说明如下：

    		CGSize  返回当前位置（indexPath）cell的大小


* <font color=red , size=3>**当前组的弧度范围（即该组展开弧度）**</font>
 
	* <font color="#006666">**- (<font color="#0000dd">CGFloat </font>)flowLayout:(XFCyclicAnnularFlowLayout *)flowLayout cyclicAnnularRadianInSection:(NSInteger)section;**</font><br />
 
 	* 返回参数类型值说明如下：

    		CGFloat  返回当前组元素在视图上展开的弧度范围

* <font color=red , size=3>**一共有多少组**</font>
 
	* <font color="#006666">**- (<font color="#0000dd"> NSInteger </font>)numberOfSectionsInFlowLayout:(XFCyclicAnnularFlowLayout *)flowLayout;**</font><br />
 
 	* 返回参数类型值说明如下：

    		NSInteger  该返回值设定视图的环形一共有多少层，默认是 1 层

* <font color=red , size=3>**该组元素在扇形区域内是否顺时针展开**</font>
 
	* <font color="#006666">**- (<font color="#0000dd"> BOOL </font>)flowLayout:(XFCyclicAnnularFlowLayout*)flowLayout cyclicIsClockwiseInSection:(NSInteger)section;**</font><br />
 
 	* 返回参数类型值说明如下：

    		BOOL  该返回值设定视图当前环形中cell是顺时针依次排列，还是逆时针依次排列，默认是顺时针

* <font color=red , size=3>**元素朝向**</font>
 
	* <font color="#006666">**- (<font color="#0000dd">XFCyclicAnnularItemOrientation</font> )cyclicAnnularItemOrientationInFlowLayout:(XFCyclicAnnularFlowLayout *)flowLyout;**</font><br />
 
 	* 返回参数类型值说明如下：
 	

    		typedef NS_ENUM(NSUInteger, XFCyclicAnnularItemOrientation) {
    		XFCyclicAnnularItemOrientationUp,           // 朝上 默认
    		XFCyclicAnnularItemOrientationDown,         // 朝下
    		XFCyclicAnnularItemOrientationInside,       // 朝内
    		XFCyclicAnnularItemOrientationOutside       // 朝外
    		};
    
 


