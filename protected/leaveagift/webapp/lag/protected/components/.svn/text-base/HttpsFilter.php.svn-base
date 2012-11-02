<?

class HttpsFilter extends CFilter {

    protected function preFilter( $filterChain ) 
        {
        if ( !Yii::app()->getRequest()->isSecureConnection ) 
         {

            /* Redirect to the secure version of the page.*/

            $myurl= Yii::app()->params['myurl'];
            Yii::app()->request->redirect($myurl);
            return false;
         }
        return true;
     }
}

?>
