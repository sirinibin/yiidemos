<?php

class HttpRequest extends CHttpRequest {

    public $noCsrfValidationRoutes = array();

        /**
        * Normalizes the request data.
        * This method strips off slashes in request data if get_magic_quotes_gpc() returns true.
        * It also performs CSRF validation if {@link enableCsrfValidation} is true.
        */
        protected function normalizeRequest()
        {
            parent::normalizeRequest();
            if ($this->getIsPostRequest() && $this->enableCsrfValidation && !$this->checkCurrentRoute())
                    Yii::app()->detachEventHandler('onbeginRequest', array($this, 'validateCsrfToken'));
        }
        
        /**
                * Checks if current route should be validated by validateCsrfToken()
                * @return boolean true if current route should be validated 
                */
        private function checkCurrentRoute() {
            foreach ($this->noCsrfValidationRoutes as $checkPath) 
            {
                if (($pos = strpos($checkPath, "*")) !== false) 
                {
                    $checkPath = substr($checkPath, 0, $pos - 1);
                    if (strpos($this->pathInfo, $checkPath) == 0)
                        return false;
                } elseif ($this->pathInfo === $checkPath)
                    return false;
            }
            return true;
        }
}
