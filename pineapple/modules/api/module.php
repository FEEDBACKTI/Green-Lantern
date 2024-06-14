<?php namespace pineapple;

class ExampleModule extends Module
{
    public function route()
    {
        switch ($this->request->action) {
            case 'getHello':
                $this->hello();
                break;
        }
    }

    private function hello()
    {
        $this->response = array('text' => "Hola Mundo");
    }
}
