import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
import $ from 'jquery'
import SongSheet from '../components/list/SongSheet.vue'
import singer from '../components/list/singer.vue'
import rank from '../components/list/rank.vue'
import CollectionLately from '../components/list/CollectionLately.vue'
import play from '../components/list/play.vue'
import Index from "@/components/index/index"
import Navitem1 from "@/components/index/navitem/navitem1"
import Navitem2 from "@/components/index/navitem/navitem2"
import Navitem3 from "@/components/index/navitem/navitem3"
import searchHead from '@/components/searchHead/searchHead'
import search from '@/components/search/search'
import search2 from '@/components/search/search2'
import user from '@/components/user/user'
import login from '@/components/login/login'
import reg from '@/components/login/reg'
import about from '@/components/about/about'


Vue.use(Router)

export default new Router({
  routes: [
    {path: '/',redirect: { name: 'index' }},
    {path: '/index',name: 'index',component: Index},
    {path: '/navitem1',name: 'Navitem1',component: Navitem1},
    {path: '/navitem2',name: 'Navitem2',component: Navitem2},
    {path: '/navitem3',name: 'Navitem3',component: Navitem3},
    {path:'/SongSheet',name: 'SongSheet',component:SongSheet},
    {path:'/singer',name: 'singer',component:singer},
    {path:'/CollectionLately',name: 'CollectionLately',component:CollectionLately},
    {path:'/play',name: 'play',component:play},
    {path:'/searchHead',name: 'searchHead',component:searchHead},
    {path:'/search',name: 'search',component:search},
    {path:'/search2',name: 'search2',component:search2},
    {path:'/rank',name: 'rank',component:rank},
    {path:'/user',name: 'user',component:user},
    {path:'/login',name: 'login',component:login},
    {path:'/reg',name: 'reg',component:reg},
    {path:'/about',name: 'about',component:about},
  ]
})
