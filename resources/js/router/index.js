import Home from '../views/Home'
import Category from '../views/category/Index'
import Activity from '../views/activity/index'
import Possibility from '../views/Possibility/Index'
import Condition from '../views/Condition/Index'
import Threat from '../views/Threat/Index'
import Vulnerability from '../views/Vulnerability/index'
import Term from '../views/Term/Index'
import Consequence from '../views/Consequence/Index'


export default
{
    mode:'history',
    linkActiveClass:'active',
    routes: [
        {
            path:'/',
            name:'home',
            component: Home,
        },
        {
            path:'/category',
            name:'category',
            component: Category,
        },
        {
            path:'/activity',
            name:'activity',
            component: Activity,
        },
        {
            path:'/possibility',
            name:'possibility',
            component: Possibility,
        },
        {
            path:'/condition',
            name:'condition',
            component: Condition,
        },
        {
            path:'/threat',
            name:'threat',
            component: Threat,
        },
        {
            path:'/vulnerability',
            name:'vulnerability',
            component: Vulnerability,
        },
        {
            path:'/term',
            name:'term',
            component: Term,
        },
        {
            path:'/consequence',
            name:'consequence',
            component: Consequence,
        },
    ]
}