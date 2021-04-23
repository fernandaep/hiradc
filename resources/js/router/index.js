import Home from '../views/Home'
import Karyawan from '../views/Karyawan/Index'
import Category from '../views/category/Index'
import Activity from '../views/activity/index'
import Possibility from '../views/Possibility/Index'
import Condition from '../views/Condition/Index'
import Threat from '../views/Threat/Index'
import Vulnerability from '../views/Vulnerability/index'
import Term from '../views/Term/Index'
import Consequence from '../views/Consequence/Index'
import createConsequence from '../views/Consequence/create'
import editConsequence from '../views/Consequence/edit'
import K3team from '../views/K3team/Index'
import Register from '../views/Register/Index'



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
            path:'/karyawan',
            name:'karyawan',
            component: Karyawan,
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
        {
            path:'/createconsequence/',
            name:'consequence.create',
            component: createConsequence,
        },
        {
            path:'/editconsequence/:id',
            name:'consequence.edit',
            component: editConsequence,
            props: true,
        },
        {
            path:'/k3team',
            name:'k3team',
            component: K3team,
        },
        {
            path:'/register',
            name:'register',
            component: Register,
        },
    ]
}