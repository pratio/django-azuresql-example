from django.urls import include, path

from . import views
from . views import QuestionListView

urlpatterns = [
    # path('', views.index, name='index'),
    path('', QuestionListView.as_view()),
    path('', include('social_django.urls')),
]

