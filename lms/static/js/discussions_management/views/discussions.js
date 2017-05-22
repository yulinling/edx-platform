(function(define) {
    'use strict';
    define(['jquery', 'underscore', 'backbone', 'gettext',
        'js/discussions_management/views/divided_discussions_inline',
        'js/discussions_management/views/divided_discussions_course_wide',
        'edx-ui-toolkit/js/utils/html-utils'
    ],

        function($, _, Backbone, gettext, InlineDiscussionsView, CourseWideDiscussionsView, HtmlUtils) {
            var hiddenClass = 'is-hidden';
            var cohort = 'cohort';
            var none = 'none';
            var enrollmentTrack = 'enrollment_track';

            var DiscussionsView = Backbone.View.extend({
                events: {
                    'click .division-scheme': 'divisionSchemeChanged'
                },

                initialize: function(options) {
                    this.template = HtmlUtils.template($('#discussions-tpl').text());
                    this.context = options.context;
                    this.discussionSettings = options.discussionSettings;
                },

                render: function() {
                    console.dir(this.discussionSettings);
                    HtmlUtils.setHtml(this.$el, this.template({
                        availableSchemes: this.getDivisionSchemeData(this.discussionSettings.division_scheme)
                    }));
                    var selectedScheme = this.getSelectedScheme(),
                        topicNav = this.getTopicNav();
                    this.hideTopicNav(selectedScheme, topicNav);
                    this.showDiscussionTopics();
                    return this;
                },

                getDivisionSchemeData: function(selectedScheme) {
                    console.log('here: ' + selectedScheme);
                    // TODO: get available schemes and currently selected scheme from this.discussionSettings
                    return [
                        {
                            key: none,
                            displayName: gettext('Not divided'),
                            descriptiveText: gettext('Discussions are unified; all learners interact with posts from other learners, regardless of the group they are in.'),
                            selected: none === selectedScheme
                        },
                        {
                            key: enrollmentTrack,
                            displayName: gettext('Enrollment Tracks'),
                            descriptiveText: gettext('Use enrollment tracks as the basis for dividing discussions. All learners, regardless of their enrollment track, see the same discussion topics, but within divided topics, only learners who are in the same enrollment track see and respond to each others’ posts.'),
                            selected: enrollmentTrack === selectedScheme
                        },
                        {
                            key: cohort,
                            displayName: gettext('Cohorts'),
                            descriptiveText: gettext('Use cohorts as the basis for dividing discussions. All learners, regardless of cohort, see the same discussion topics, but within divided topics, only members of the same cohort see and respond to each others’ posts. '),
                            selected: cohort === selectedScheme
                        }

                    ];
                },

                getSelectedScheme: function() {
                    return this.$('input[name="division-scheme"]:checked').val();
                },

                getTopicNav: function() {
                    return this.$('.topic-division-nav');
                },

                divisionSchemeChanged: function() {
                    var selectedScheme = this.getSelectedScheme(),
                        topicNav = this.getTopicNav(),
                        messageSpan = this.$('.division-scheme-message'),
                        fieldData = {
                            division_scheme: selectedScheme
                        };

                    this.hideTopicNav(selectedScheme, topicNav);
                    this.saveDivisionScheme(topicNav, fieldData);
                    this.showSelectMessage(selectedScheme, messageSpan);
                },

                saveDivisionScheme: function($element, fieldData) {

                    var discussionSettingsModel = this.discussionSettings,
                        saveOperation = $.Deferred();

                    discussionSettingsModel.save(
                        fieldData, {patch: true, wait: true}
                    ).done(function() {
                        saveOperation.resolve();
                    }).fail(function(result) {
                        var errorMessage = null,
                            jsonResponse;
                        try {
                            jsonResponse = JSON.parse(result.responseText);
                            errorMessage = jsonResponse.error;
                        } catch (e) {
                            // Ignore the exception and show the default error message instead.
                        }
                        if (!errorMessage) {
                            errorMessage = gettext('We\'ve encountered an error. ' +
                                'Refresh your browser and then try again.');
                        }
                        // TODO add in error dispaly here
                        saveOperation.reject();
                    });
                },

                hideTopicNav: function(selectedScheme, topicNav) {
                    if (selectedScheme === none) {
                        topicNav.addClass(hiddenClass);
                    } else {
                        topicNav.removeClass(hiddenClass);
                    }
                },

                showSelectMessage: function(selectedScheme, messageSpan) {
                    switch (selectedScheme) {
                        case none:
                            messageSpan.text(gettext('Discussion topics in the course are not divided.'));
                            break;
                        case enrollmentTrack:
                            messageSpan.text(gettext('Any divided discussion topics are divided based on enrollment track.'));
                            break;
                        case cohort:
                            messageSpan.text(gettext('Any divided discussion topics are divided based on cohort.'));
                            break;
                    }
                },

                getSectionCss: function(section) {
                    return ".instructor-nav .nav-item [data-section='" + section + "']";
                },

                showDiscussionTopics: function() {
                    var dividedDiscussionsElement = this.$('.discussions-nav');
                    if (!this.CourseWideDiscussionsView) {
                        this.CourseWideDiscussionsView = new CourseWideDiscussionsView({
                            el: dividedDiscussionsElement,
                            model: this.context.courseDiscussionTopicDetailsModel,
                            discussionSettings: this.discussionSettings
                        }).render();
                    }

                    if (!this.InlineDiscussionsView) {
                        this.InlineDiscussionsView = new InlineDiscussionsView({
                            el: dividedDiscussionsElement,
                            model: this.context.courseDiscussionTopicDetailsModel,
                            discussionSettings: this.discussionSettings
                        }).render();
                    }
                }
            });
            return DiscussionsView;
        });
}).call(this, define || RequireJS.define);
